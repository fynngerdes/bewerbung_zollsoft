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
        'Aufbau und Arbeitsweise von Netzwerken',
        'Objektorientierte Programmierung mit Java',
        'Entwicklung von Java-Anwendungen mit grafischen Benutzeroberflächen',
        'Qualitätssicherung von Software-Produkten',
        'Datenbankprogrammierung mit SQL',
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
        'Weitere Punkte siehe Berufserfahrung',
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
      description: [
        'Planung, Installation und Administration der gesamten WLAN-Infrastruktur des Unternehmens',
        'Eigenverantwortlicher Aufbau und kontinuierliche Weiterentwicklung der Netzwerkinfrastruktur',
        'Organisation, Planung und Vorbereitung von Großveranstaltungen, insbesondere Konzerte, Tanzveranstaltungen und Firmenevents',
        'Disposition, Bestellung und Kontrolle sämtlicher für den Veranstaltungsbetrieb benötigter Waren',
        'Organisation und Koordinierung des Backstage-Bereichs',
        'Betreuung von Künstler:innen, Crews, Technikdienstleister:innen und Catering-Unternehmen',
      ],
      location: 'Bremen',
      icon: Icons.music_note_outlined,
    ),
    CvEntry(
      period: '2020 - 2022',
      title: 'Verkauf',
      institution: 'Autohaus Wilke',
      description: [
        'Fahrzeugankauf aus dem privaten und gewerblichen Bereich',
        'Fahrzeugverkauf an Endkund:innen',
        'Bearbeitung der gesamten Sachbearbeitung aus den oben genannten Bereichen',
        'Vermittlung von Finanzierungs- und Leasingverträgen',
        'Organisation und Pflege des Fahrzeugbestands',
      ],
      location: 'Wildeshausen',
      icon: Icons.sell_outlined,
    ),
    CvEntry(
      period: '2019 - 2020',
      title: 'Verkauf',
      institution: 'Euronics XXL',
      description: [
        'Aktiver Verkauf und fachkundige Beratung von Kund:innen in der Abteilung PC und Telekommunikation',
        'Kontinuierliche Sortiments- und Regalpflege zur Sicherstellung einer optimalen Warenverfügbarkeit',
        'Ansprechende, übersichtliche und verkaufsfördernde Präsentation der Produkte auf der Verkaufsfläche',
        'Eigenständige und marktgerechte Preisgestaltung sowie zuverlässige Preisauszeichnung der Artikel',
        'Kompetente Beratung zu individuellen Finanzierungsangeboten und vollständige Vertragsabwicklung',
        'Fachgerechtes Reklamationsmanagement und kundenorientierte Bearbeitung von Beschwerden',
      ],
      location: 'Wildeshausen',
      icon: Icons.sell_outlined,
    ),
  ];
}
