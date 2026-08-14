import '../models/document_entry_model.dart';

abstract class DocumentsData {
  static const List<DocumentEntry> allDocuments = [
    // 1. Arbeitszeugnisse
    DocumentEntry(
      title: 'Arbeitszeugnis (Zwischenzeugnis)',
      institution: 'Aladin Music-Hall',
      category: DocumentCategory.employment,
      assetPath: 'assets/documents/rechnung.pdf',
    ),
    DocumentEntry(
      title: 'Arbeitszeugnis',
      institution: 'Autohaus Wilke',
      category: DocumentCategory.employment,
      assetPath: 'assets/documents/rechnung.pdf',
    ),
    DocumentEntry(
      title: 'Arbeitszeugnis',
      institution: 'Euronics XXL',
      category: DocumentCategory.employment,
      assetPath: 'assets/documents/rechnung.pdf',
    ),

    // 2. Ausbildungszeugnisse
    DocumentEntry(
      title: 'Abschlusszertifikat ILS',
      institution: 'ILS – Institut für Lernsysteme',
      category: DocumentCategory.education,
      assetPath: 'assets/documents/rechnung.pdf',
    ),
    DocumentEntry(
      title: 'IHK Prüfungs- & Ausbildungszeugnis',
      institution: 'Euronics XXL / IHK',
      category: DocumentCategory.education,
      assetPath: 'assets/documents/rechnung.pdf',
    ),

    // 3. Sonstige
    DocumentEntry(
      title: 'Musterdokument & Beleg (Demo)',
      institution: 'Zollsoft Bewerbungsunterlagen',
      category: DocumentCategory.other,
      assetPath: 'assets/documents/rechnung.pdf',
    ),
  ];
}
