import 'package:flutter/material.dart';
import '../models/self_assessment_item_model.dart';

const List<SelfAssessmentItemModel> selfAssessmentItems = [
  SelfAssessmentItemModel(
    isMastered: true,
    title: 'Lokale Datenhaltung',
    description:
        'Praxiserfahrung mit SharedPreferences, Hive und SQLite zur sicheren Speicherung.',
    icon: Icons.storage_rounded,
  ),
  SelfAssessmentItemModel(
    isMastered: true,
    title: 'UI & Responsive Layouts',
    description:
        'Ich arbeite kontinuierlich an komplexeren Layouts und flüssigen Animationen.',
    icon: Icons.dashboard_customize_rounded,
  ),
  SelfAssessmentItemModel(
    isMastered: true,
    title: 'Material Design',
    description:
        'Ich habe fundierte Kenntnisse in der Implementierung der offiziellen Material Design Richtlinien für Flutter-Apps.',
    icon: Icons.style_rounded,
  ),
  SelfAssessmentItemModel(
    isMastered: true,
    title: 'REST APIs & Remote Data',
    description:
        'Anbindung von RESTful-Schnittstellen mit Fehlerbehandlung und sauberer JSON-Deserialisierung.',
    icon: Icons.cloud_sync_rounded,
    customWidget: Text('Hier kommt die Pokemon API hin.'),
  ),
  SelfAssessmentItemModel(
    isMastered: true,
    title: 'State Management',
    description:
        'Sicherer Umgang mit Riverpod & Provider zur klaren Trennung von UI und Geschäftslogik.',
    icon: Icons.alt_route_rounded,
    customWidget: Text('Die kommt der Theme switch hin.'),
  ),
  SelfAssessmentItemModel(
    isMastered: false,
    title: 'Clean Architecture',
    description:
        'Strukturierung von Apps in Feature-Ordner sowie UI-, Domain- und Data-Layer.',
    icon: Icons.account_tree_rounded,
  ),
  SelfAssessmentItemModel(
    isMastered: false,
    title: 'Git & Versionskontrolle',
    description:
        'Grundlagen von Branching, Commits und kollaborativem Arbeiten mit Git.',
    icon: Icons.source_rounded,
  ),
  SelfAssessmentItemModel(
    isMastered: false,
    title: 'Automatisierte Tests',
    description:
        'Aktive Vertiefung in Unit- & Widget-Testing für regressionsfreie Codebases.',
    icon: Icons.fact_check_rounded,
  ),
];
