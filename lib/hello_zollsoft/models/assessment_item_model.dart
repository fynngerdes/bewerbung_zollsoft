import 'package:flutter/material.dart';

class AssessmentItem {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final Widget? customWidget;

  const AssessmentItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    this.customWidget,
  });
}
