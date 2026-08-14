import '../models/cv_entry.dart';

abstract class CvData {
  static const List<CvEntry> schulbildungEntries = [
    CvEntry(
      period: '2016',
      title: 'Sekundarabschluss 1',
      institution: 'Hauptschule',
      location: 'Wildeshausen',
    ),
    CvEntry(
      period: '2015 – 2016',
      title: '10. Klasse',
      institution: 'Hauptschule',
      location: 'Wildeshausen',
    ),
    CvEntry(
      period: '2012 – 2015',
      title: '7 - 9. Klasse',
      institution: 'Realschule',
      location: 'Wildeshausen',
    ),
    CvEntry(
      period: '2005 – 2012',
      title: '1 - 7. Klasse',
      institution: 'Gut Spascher Sand',
      location: 'Wildeshausen',
    ),
  ];

  static const List<CvEntry> ausbildungEntries = [
    CvEntry(
      period: '2020 - 2023',
      title: 'Staatlich anerkannter Softwareentwickler',
      institution: 'ILS',
      description: [
        'Schwerpunkte Java & GUI-Programmierung',
        'App-Entwicklung & IT-Sicherheit',
        'Datenbankprogrammierung & Qualitätssicherung',
      ],
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
    ),
  ];

  static const List<CvEntry> berufserfahrungEntries = [
    CvEntry(
      period: '2022 - jetzt',
      title: 'Gastronomie - Veranstaltungstechnik',
      institution: 'Aladin Music-Hall',
      description: [
        'Gastronomie & Service',
        'Veranstaltungstechnik',
      ],
      location: 'Bremen',
    ),
    CvEntry(
      period: '2020 - 2022',
      title: 'Verkauf',
      institution: 'Autohaus Wilke',
      description: [
        'Verkauf und Beratung im Bereich Neu- und Gebrauchtwagen',
      ],
      location: 'Wildeshausen',
    ),
    CvEntry(
      period: '2019 - 2020',
      title: 'Verkauf',
      institution: 'Euronics XXL',
      description: [
        'Kundenberatung & Verkauf',
        'Warenmanagement',
      ],
      location: 'Wildeshausen',
    ),
  ];
}
