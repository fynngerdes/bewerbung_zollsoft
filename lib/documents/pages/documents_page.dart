import 'package:bewerbung_zollsoft/common_widgets/heading_indicator_with_title_widget.dart';
import 'package:flutter/material.dart';
import '../data/documents_data.dart';
import '../models/document_entry_model.dart';
import '../widgets/document_card_widget.dart';
import '../widgets/document_filter_chips_widget.dart';

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
              DocumentFilterChipsWidget(
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() => _selectedCategory = category);
                },
              ),
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

  Widget _buildDocumentList(bool isMobile) {
    final docs = _filteredDocuments;

    if (docs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.folder_open_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
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
        children: List.generate(docs.length, (index) {
          final isLast = index == docs.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
            child: DocumentCardWidget(document: docs[index]),
          );
        }),
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
