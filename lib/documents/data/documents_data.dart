import '../models/document_entry_model.dart';

abstract class DocumentsData {
  static const List<DocumentEntry> allDocuments = [
    // 1. Arbeitszeugnisse
    DocumentEntry(
      title: 'Arbeitszeugnis',
      institution: 'Aladin Music-Hall',
      category: DocumentCategory.employment,
      assetPath: 'documents/Arbeitszeugnis-Aladin.pdf',
    ),
    DocumentEntry(
      title: 'Arbeitszeugnis',
      institution: 'Autohaus Wilke',
      category: DocumentCategory.employment,
      assetPath: 'documents/Arbeitszeugnis Auto-Wilke.pdf',
    ),
    DocumentEntry(
      title: 'Arbeitszeugnis',
      institution: 'Euronics XXL',
      category: DocumentCategory.employment,
      assetPath: 'documents/Arbeitszeugnis Euronics.pdf',
    ),

    // 2. Ausbildungszeugnisse
    DocumentEntry(
      title: 'Abschlusszeugnis (Mittlere Reife)',
      institution: 'Hauptschule Wildeshausen',
      category: DocumentCategory.education,
      assetPath: 'documents/Abschlusszeugnis-Schule.pdf',
    ),
    DocumentEntry(
      title: 'Abschlusszeugnis',
      institution: 'ILS – Institut für Lernsysteme',
      category: DocumentCategory.education,
      assetPath: 'documents/ILS-Abschlusszeugnis.pdf',
    ),
    DocumentEntry(
      title: 'Prüfungs- & Ausbildungszeugnis',
      institution: 'Euronics XXL / IHK',
      category: DocumentCategory.education,
      assetPath: 'documents/IHK-Abschlusszeugnis.pdf',
    ),

    // 3. Sonstige
    DocumentEntry(
      title: 'Zertifikat Schlagfertigkeitstraining',
      institution: 'IHK',
      category: DocumentCategory.other,
      assetPath: 'documents/IHK-Schlagfertigkeitstraining.pdf',
    ),
  ];
}
