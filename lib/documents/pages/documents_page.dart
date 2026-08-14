import 'package:bewerbung_zollsoft/common_widgets/heading_indicator_with_title_widget.dart';
import 'package:flutter/material.dart';
import '../data/documents_data.dart';
import '../models/document_entry_model.dart';
import '../widgets/document_card_widget.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  DocumentCategory? _selectedCategory; // null = Alle

  List<DocumentEntry> get _filteredDocuments {
    if (_selectedCategory == null) {
      return DocumentsData.allDocuments;
    }
    return DocumentsData.allDocuments
        .where((doc) => doc.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 32.0,
            vertical: 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildHeader(theme),
              const SizedBox(height: 24),
              _buildCategoryFilter(theme),
              const SizedBox(height: 24),
              _buildDocumentList(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildHeader(ThemeData theme) {
    return [
      const HeadingIndicatorWithTitleWidget(title: 'Dokumente'),
      const SizedBox(height: 8),
      Text(
        'Zeugnisse, Zertifikate & Nachweise',
        style: theme.textTheme.titleMedium,
      ),
    ];
  }

  Widget _buildCategoryFilter(ThemeData theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // "Alle" Filter
          _buildFilterChip(
            theme: theme,
            label: 'Alle',
            count: DocumentsData.allDocuments.length,
            isSelected: _selectedCategory == null,
            onSelected: () => setState(() => _selectedCategory = null),
          ),
          const SizedBox(width: 8),
          ...DocumentCategory.values.map((category) {
            final count = DocumentsData.allDocuments
                .where((d) => d.category == category)
                .length;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildFilterChip(
                theme: theme,
                label: category.label,
                count: count,
                isSelected: _selectedCategory == category,
                onSelected: () => setState(() => _selectedCategory = category),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required ThemeData theme,
    required String label,
    required int count,
    required bool isSelected,
    required VoidCallback onSelected,
  }) {
    return FilterChip(
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (_) => onSelected(),
    );
  }

  Widget _buildDocumentList(bool isMobile) {
    final docs = _filteredDocuments;

    if (docs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            children: [
              const Icon(Icons.folder_open_outlined, size: 48),
              const SizedBox(height: 12),
              Text(
                'Keine Dokumente in dieser Kategorie vorhanden',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    if (isMobile) {
      return Column(
        children: docs.map((document) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: DocumentCardWidget(document: document),
          );
        }).toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = (constraints.maxWidth - 20) / 2;
        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: docs.map((document) {
            return SizedBox(
              width: itemWidth,
              child: DocumentCardWidget(document: document),
            );
          }).toList(),
        );
      },
    );
  }
}
