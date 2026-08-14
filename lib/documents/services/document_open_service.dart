import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DocumentOpenService {
  static Future<void> openInNewTab(String assetPath) async {
    try {
      final uri = Uri.parse(assetPath);
      await launchUrl(uri, webOnlyWindowName: '_blank');
    } catch (e) {
      debugPrint('Fehler beim Öffnen des Dokuments: $e');
    }
  }
}
