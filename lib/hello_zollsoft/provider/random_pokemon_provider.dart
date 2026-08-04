import 'dart:convert';
import 'dart:math';

import 'package:bewerbung_zollsoft/hello_zollsoft/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_pokemon_provider.g.dart';

const Map<String, String> _typeGermanNames = {
  'normal': 'Normal',
  'fire': 'Feuer',
  'water': 'Wasser',
  'grass': 'Pflanze',
  'electric': 'Elektro',
  'ice': 'Eis',
  'fighting': 'Kampf',
  'poison': 'Gift',
  'ground': 'Boden',
  'flying': 'Flug',
  'psychic': 'Psycho',
  'bug': 'Käfer',
  'rock': 'Gestein',
  'ghost': 'Geist',
  'dragon': 'Drache',
  'dark': 'Unlicht',
  'steel': 'Stahl',
  'fairy': 'Fee',
};

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

  final pokemonResponse = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomID'),
  );
  final speciesResponse = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$randomID'),
  );

  final pokemonData = jsonDecode(pokemonResponse.body);
  final speciesData = jsonDecode(speciesResponse.body);

  // 1. Deutscher Name (Fallback auf Englisch oder name aus pokemonData)
  final namesList = speciesData['names'] as List? ?? [];
  final germanNameEntry = namesList.firstWhere(
    (entry) => entry['language']['name'] == 'de',
    orElse: () => namesList.firstWhere(
      (entry) => entry['language']['name'] == 'en',
      orElse: () => {'name': pokemonData['name'] ?? ''},
    ),
  );
  final germanName = germanNameEntry['name'].toString();

  // 2. Deutsche Beschreibung (Fallback auf Englisch)
  final flavorList = speciesData['flavor_text_entries'] as List? ?? [];
  final germanDescEntry = flavorList.firstWhere(
    (entry) => entry['language']['name'] == 'de',
    orElse: () => flavorList.firstWhere(
      (entry) => entry['language']['name'] == 'en',
      orElse: () => {'flavor_text': ''},
    ),
  );
  final germanDesc = germanDescEntry['flavor_text']
      .toString()
      .replaceAll('\n', ' ')
      .replaceAll('\f', ' ');

  // 3. Bild & Typen
  final imageUrl =
      pokemonData['sprites']['other']['official-artwork']['front_default'] ??
      '';
  final rawTypes = (pokemonData['types'] as List)
      .map((t) => t['type']['name'].toString())
      .toList();

  // Typennamen auf Deutsch mappen
  final germanTypes = rawTypes.map((t) {
    return _typeGermanNames[t.toLowerCase()] ??
        (t.isNotEmpty ? t[0].toUpperCase() + t.substring(1) : t);
  }).toList();

  // 4. Offizielle Farbe direkt aus der PokéAPI species-Antwort auslesen
  final colorName = speciesData['color']?['name']?.toString() ?? '';
  final pokemonColor = _parsePokemonColor(colorName);

  return Pokemon(
    id: randomID,
    name: germanName,
    imageUrl: imageUrl,
    types: germanTypes,
    description: germanDesc,
    color: pokemonColor,
  );
}
