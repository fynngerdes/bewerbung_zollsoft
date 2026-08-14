# Zollsoft Bewerbungs-App

Interaktive Bewerbungs-Webanwendung für die Position als Flutter Developer bei der zollsoft GmbH.

Entwickelt von **Fynn Gerdes**

## Über das Projekt

Diese Web-App dient als interaktive Bewerbung und stellt Qualifikationen, Werdegang sowie Code-Beispiele direkt in einer lauffähigen Flutter-Anwendung dar. Sie demonstriert praxisnahe Kenntnisse in modernem State Management, deklarativem Routing und responsivem UI-Design.

## Funktionen

- **Responsives Shell-Layout:**
  - Desktop: Feste Navigationsleiste mit Profilansicht und Direktlinks.
  - Mobile & Tablet: Automatische Umschaltung auf eine kompakte Bottom Navigation Bar.
- **Material 3 Design & Dynamic Theming:**
  - Umschaltung zwischen Light Mode und Dark Mode via Riverpod State Management.
  - Konsistente Typografie mit der Schriftart *Inter*.
- **Live-Demonstrationen:**
  - REST-API: Asynchrone Abfrage der PokéAPI inklusive Loading- und Error-States.
  - State Management: Reaktives Management von Theme- und Anwendungszuständen.
- **Lebenslauf:**
  - Strukturierte Meilensteine und Details zu Berufserfahrung, Aus- und Weiterbildung sowie Schulbildung.
- **Dokumente:**
  - Übersicht und Nachweise zu Zeugnissen und Zertifikaten.

## Projektstruktur

Das Projekt folgt einem **Feature-First-Ansatz**, bei dem die Funktionalitäten modular in Schichten (Data, Models, Pages, Provider, Widgets) unterteilt sind:

```text
lib/
├── common_widgets/          # Wiederverwendbare globale UI-Komponenten
├── cv/                      # Feature: Lebenslauf & Werdegang
│   ├── data/                # Statische Daten (Berufserfahrung, Ausbildung, Schule)
│   ├── models/              # Datenmodelle für Lebenslauf-Einträge
│   ├── pages/               # Hauptansicht (CvPage)
│   └── widgets/             # Timeline-Cards & scrollbare Sektionen
├── documents/               # Feature: Dokumente & Zeugnisse
│   └── pages/               # Übersicht für Nachweise & Zertifikate (DocumentsPage)
├── hello_zollsoft/          # Feature: Startseite & interaktive Vorstellung
│   ├── data/                # Datengrundlage für Selbsteinschätzung & Skills
│   ├── models/              # Datenmodelle für Skills & API-Responses
│   ├── pages/               # Hauptseite (HelloZollsoftPage)
│   ├── provider/            # Riverpod State Management (Theme & PokéAPI)
│   └── widgets/             # UI-Sektionen (Pitch, Roadmap, Skill-Grid & Live-Demos)
├── routing_navigation/      # Routing & adaptives Navigationskonzept
│   ├── pages/               # ShellLayoutPage (Responsive Shell)
│   ├── provider/            # GoRouter-Konfiguration mit StatefulShellRoute
│   └── widgets/             # Desktop-Sidebar & Mobile Bottom Navigation Bar
└── main.dart                # App-Einstiegspunkt, ProviderScope & MaterialApp.router
```

## Einsatz von KI

KI wurde punktuell als Unterstützung für grobe UI-Entwürfe und bei kniffligen Detailfragen eingesetzt. Die Architektur, Ordnerstruktur und die manuelle Ausarbeitung des Codes stammen eigenständig von mir.

## CI/CD & Deployment

Die Web-App wird über einen GitHub Actions Workflow automatisch gebaut und via Coolify auf einem IONOS VPS bereitgestellt.

## Kontakt

- **Fynn Gerdes**
- E-Mail: [hello@fynn-gerdes.dev](mailto:hello@fynn-gerdes.dev)
- GitHub: [github.com/fynngerdes](https://github.com/fynngerdes)
- Repository: [github.com/fynngerdes/bewerbung_zollsoft](https://github.com/fynngerdes/bewerbung_zollsoft)
