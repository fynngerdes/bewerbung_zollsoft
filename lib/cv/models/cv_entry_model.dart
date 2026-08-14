import 'package:flutter/material.dart';

class CvEntry {
  final String period;
  final String institution;
  final String? title;
  final List<String> description;
  final String? location;
  final IconData icon;

  const CvEntry({
    required this.period,
    required this.institution,
    this.title,
    this.description = const [],
    this.location,
    required this.icon,
  });
}
