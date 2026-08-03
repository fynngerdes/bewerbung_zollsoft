import 'package:flutter/material.dart';

class SelfAssessmentItemModel {
  final bool isMastered;
  final String title;
  final String description;
  final IconData icon;
  final Widget? customWidget;

  const SelfAssessmentItemModel({
    required this.isMastered,
    required this.title,
    required this.description,
    required this.icon,
    this.customWidget,
  });
}
