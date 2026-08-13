import 'dart:convert';
import 'dart:math';

import 'package:bewerbung_zollsoft/hello_zollsoft/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_pokemon_provider.g.dart';

Color _parsePokemonColor(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'black':
      return Colors.grey.shade900;
    case 'blue':
      return Colors.blue;
    case 'brown':
      return Colors.brown;
    case 'gray':
      return Colors.blueGrey;
    case 'green':
      return Colors.green;
    case 'pink':
      return Colors.pink;
    case 'purple':
      return Colors.purple;
    case 'red':
      return Colors.red;
    case 'white':
      return Colors.grey.shade400;
    case 'yellow':
      return Colors.amber;
    default:
      return Colors.teal;
  }
}

@Riverpod(keepAlive: true)
Future<Pokemon> randomPokemon(Ref ref) async {
  final int randomID = Random().nextInt(1000) + 1;
  final client = http.Client();

  http.Response pokemonResponse;
  http.Response speciesResponse;

  try {
    pokemonResponse = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomID'))
        .timeout(const Duration(seconds: 4));
    speciesResponse = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$randomID'))
        .timeout(const Duration(seconds: 4));

    if (pokemonResponse.statusCode != 200 ||
        speciesResponse.statusCode != 200) {
      throw Exception('Fehler beim Abrufen der PokéAPI');
    }
  } catch (_) {
    throw Exception('Fehler beim Laden (z. B. keine Internetverbindung)');
  } finally {
    client.close();
  }

  final pokemonData = jsonDecode(pokemonResponse.body);
  final speciesData = jsonDecode(speciesResponse.body);

  // 1. Name
  final rawName = pokemonData['name']?.toString() ?? '';
  final name = rawName.isNotEmpty
      ? rawName[0].toUpperCase() + rawName.substring(1)
      : rawName;

  // 2. Beschreibung
  final flavorList = speciesData['flavor_text_entries'] as List? ?? [];
  final descEntry = flavorList.firstWhere(
    (entry) => entry['language']['name'] == 'en',
    orElse: () => {'flavor_text': ''},
  );
  final description = descEntry['flavor_text']
      .toString()
      .replaceAll('\n', ' ')
      .replaceAll('\f', ' ');

  // 3. Bild & Typen
  final imageUrl =
      pokemonData['sprites']['other']['official-artwork']['front_default'] ??
      '';
  final types = (pokemonData['types'] as List).map((t) {
    final tName = t['type']['name'].toString();
    return tName.isNotEmpty
        ? tName[0].toUpperCase() + tName.substring(1)
        : tName;
  }).toList();

  // 4. Offizielle Farbe
  final colorName = speciesData['color']?['name']?.toString() ?? '';
  final pokemonColor = _parsePokemonColor(colorName);

  return Pokemon(
    id: randomID,
    name: name,
    imageUrl: imageUrl,
    types: types,
    description: description,
    color: pokemonColor,
  );
}
