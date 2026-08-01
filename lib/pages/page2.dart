import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16.0 : 32.0,
              vertical: 32.0,
            ),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: theme.colorScheme.outlineVariant.withAlpha(50),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sender and Recipient header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fynn Gerdes',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'fynn.gerdes@outlook.com',
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                'github.com/fynngerdes',
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'zollsoft GmbH',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Dammstraße 3-5',
                              style: theme.textTheme.bodySmall,
                            ),
                            Text(
                              '07749 Jena',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Date line
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Jena, den 16. Juli 2026',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant.withAlpha(
                            150,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Subject line
                    Text(
                      'Bewerbung als Flutter Developer',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Cover Letter Content
                    _paragraph(
                      'Sehr geehrtes tomedo-Team,',
                      theme,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    _paragraph(
                      'die Medizinbranche digitalisieren und das Ganze mit nativer Software im Apple-Ökosystem – das ist genau das, was mich an zollsoft und tomedo® begeistert. Als leidenschaftlicher Flutter Developer, der seinen weg über die eigene Begeisterung und Autodidaktik gefunden hat, bringe ich frischen Wind, Tatendrang und eine enorme Lernbereitschaft mit.',
                      theme,
                    ),
                    _paragraph(
                      'Mit Flutter habe ich eine Technologie gefunden, die mich täglich fasziniert. Die Möglichkeit, performante, schöne und responsive Anwendungen für iOS, macOS und das Web aus einer Codebasis zu erstellen, treibt mich an. In meinen bisherigen Projekten habe ich mich intensiv mit moderner Softwarearchitektur, reactive State Management mit Riverpod (welches ich auch in dieser App verwende) sowie robusten Clean-Code-Prinzipien auseinandergesetzt.',
                      theme,
                    ),
                    _paragraph(
                      'Was mich als Quereinsteiger auszeichnet? Ich bringe eine hohe Eigeninitiative und eine ausgeprägte Problemlösungskompetenz mit. Wenn ich vor einer Hürde stehe, recherchiere und probiere ich so lange, bis ich eine elegante Lösung finde. Ich freue mich darauf, dieses Mindset in euer agiles Team in Jena einzubringen, um gemeinsam tomedo® und andere zollsoft-Produkte noch besser zu machen.',
                      theme,
                    ),
                    _paragraph(
                      'Über die Gelegenheit, mich euch persönlich vorzustellen und darüber zu sprechen, wie ich euer Team als motivierter Flutter Developer unterstützen kann, freue ich mich ausnehmend.',
                      theme,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Mit freundlichen Grüßen',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Fynn Gerdes',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _paragraph(String text, ThemeData theme, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        text,
        style:
            style ??
            theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: theme.colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}
