import 'package:flutter/material.dart';

enum DocumentCategory {
  employment(label: 'Arbeitszeugnisse', icon: Icons.work_outline_rounded),
  education(label: 'Ausbildungszeugnisse', icon: Icons.school_outlined),
  other(label: 'Sonstige', icon: Icons.description_outlined);

  final String label;
  final IconData icon;
  const DocumentCategory({required this.label, required this.icon});
}

class DocumentEntry {
  final String title;
  final String institution;
  final DocumentCategory category;
  final String assetPath;

  const DocumentEntry({
    required this.title,
    required this.institution,
    required this.category,
    required this.assetPath,
  });
}
