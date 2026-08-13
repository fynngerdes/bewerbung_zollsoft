// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(randomPokemon)
final randomPokemonProvider = RandomPokemonProvider._();

final class RandomPokemonProvider
    extends $FunctionalProvider<AsyncValue<Pokemon>, Pokemon, FutureOr<Pokemon>>
    with $FutureModifier<Pokemon>, $FutureProvider<Pokemon> {
  RandomPokemonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomPokemonProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomPokemonHash();

  @$internal
  @override
  $FutureProviderElement<Pokemon> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Pokemon> create(Ref ref) {
    return randomPokemon(ref);
  }
}

String _$randomPokemonHash() => r'd50a580a26298b69d97b2684d05e78713643a1af';
