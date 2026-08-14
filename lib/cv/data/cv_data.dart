import 'package:flutter/material.dart';

import '../models/cv_entry_model.dart';

abstract class CvData {
  static const List<CvEntry> schoolEducationEntries = [
    CvEntry(
      period: '2016',
      title: 'Sekundarabschluss 1',
      institution: 'Hauptschule',
      location: 'Wildeshausen',
      icon: Icons.verified_outlined,
    ),
    CvEntry(
      period: '2015 – 2016',
      title: '10. Klasse',
      institution: 'Hauptschule',
      location: 'Wildeshausen',
      icon: Icons.school_outlined,
    ),
    CvEntry(
      period: '2012 – 2015',
      title: '7 - 9. Klasse',
      institution: 'Realschule',
      location: 'Wildeshausen',
      icon: Icons.school_outlined,
    ),
    CvEntry(
      period: '2005 – 2012',
      title: '1 - 7. Klasse',
      institution: 'Gut Spascher Sand',
      location: 'Wildeshausen',
      icon: Icons.school_outlined,
    ),
  ];

  static const List<CvEntry> educationEntries = [
    CvEntry(
      period: '2020 - 2023',
      title: 'Softwareentwickler (Java)',
      institution: 'ILS',
      description: [
        'Schwerpunkte Java & GUI-Programmierung',
        'App-Entwicklung & IT-Sicherheit',
        'Datenbankprogrammierung & Qualitätssicherung',
      ],
      location: 'Remote',
      icon: Icons.code,
    ),
    CvEntry(
      period: '2016 – 2019',
      title: 'Ausbildung Kaufmann im Einzelhandel',
      institution: 'Euronics XXL',
      description: [
        'Kaufmännische Ausbildung',
        'Kundenberatung & Verkauf',
        'Warenmanagement',
      ],
      location: 'Wildeshausen',
      icon: Icons.badge_outlined,
    ),
  ];

  static const List<CvEntry> workExperienceEntries = [
    CvEntry(
      period: '2022 - jetzt',
      title: 'Gastronomie',
      institution: 'Aladin Music-Hall',
      description: ['Gastronomie & Service', 'Veranstaltungstechnik'],
      location: 'Bremen',
      icon: Icons.music_note_outlined,
    ),
    CvEntry(
      period: '2020 - 2022',
      title: 'Verkauf',
      institution: 'Autohaus Wilke',
      description: ['Verkauf und Beratung im Bereich Neu- und Gebrauchtwagen'],
      location: 'Wildeshausen',
      icon: Icons.sell_outlined,
    ),
    CvEntry(
      period: '2019 - 2020',
      title: 'Verkauf',
      institution: 'Euronics XXL',
      description: ['Kundenberatung & Verkauf', 'Warenmanagement'],
      location: 'Wildeshausen',
      icon: Icons.sell_outlined,
    ),
  ];
}
