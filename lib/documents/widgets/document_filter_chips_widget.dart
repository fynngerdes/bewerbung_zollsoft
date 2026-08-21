import 'package:flutter/material.dart';

import '../data/documents_data.dart';
import '../models/document_entry_model.dart';

class DocumentFilterChipsWidget extends StatelessWidget {
  const DocumentFilterChipsWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final DocumentCategory? selectedCategory;
  final ValueChanged<DocumentCategory?> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final categories = [
      null, // "Alle"
      ...DocumentCategory.values,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          final isLast = index == categories.length - 1;

          final label = category == null ? 'Alle' : category.label;
          final count = category == null
              ? DocumentsData.allDocuments.length
              : DocumentsData.allDocuments
                  .where((d) => d.category == category)
                  .length;

          return Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 8.0),
            child: FilterChip(
              selected: isSelected,
              showCheckmark: false,
              label: Text('$label ($count)'),
              labelStyle: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
              ),
              backgroundColor: theme.colorScheme.surfaceContainerLow,
              selectedColor: theme.colorScheme.primary,
              side: BorderSide(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onSelected: (_) => onCategorySelected(category),
            ),
          );
        }),
      ),
    );
  }
}
