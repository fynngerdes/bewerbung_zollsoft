import 'package:bewerbung_zollsoft/hello_zollsoft/models/pokemon_model.dart';
import 'package:bewerbung_zollsoft/hello_zollsoft/provider/random_pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomPokemonWidget extends ConsumerWidget {
  const RandomPokemonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(randomPokemonProvider);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: theme.colorScheme.outlineVariant, height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: pokemonAsync.isLoading
                  ? null
                  : () => ref.invalidate(randomPokemonProvider),
              icon: pokemonAsync.isLoading
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.primary,
                      ),
                    )
                  : const Icon(Icons.repeat, size: 18),
              style: IconButton.styleFrom(
                backgroundColor: theme.colorScheme.surfaceContainerLow
                    .withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: pokemonAsync.when(
                  data: (pokemon) => _buildCard(context, pokemon),
                  loading: () => SizedBox(
                    height: 70,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  error: (err, _) => Text(
                    'Fehler beim Laden: $err',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, Pokemon pokemon) {
    final theme = Theme.of(context);

    return Container(
      key: ValueKey(pokemon.id),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: pokemon.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: pokemon.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          if (pokemon.imageUrl.isNotEmpty)
            Image.network(pokemon.imageUrl, width: 60, height: 60),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Text(
                  pokemon.types.join(' • '),
                  style: TextStyle(
                    color: pokemon.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                if (pokemon.description.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    pokemon.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
