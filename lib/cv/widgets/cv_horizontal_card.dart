import 'package:flutter/material.dart';
import '../models/cv_entry.dart';

class CvHorizontalCard extends StatefulWidget {
  const CvHorizontalCard({
    super.key,
    required this.entry,
    this.width = 300,
  });

  final CvEntry entry;
  final double width;

  @override
  State<CvHorizontalCard> createState() => _CvHorizontalCardState();
}

class _CvHorizontalCardState extends State<CvHorizontalCard> {
  bool _isHovered = false;

  IconData _getIconForEntry(CvEntry entry) {
    final titleLower = (entry.title ?? '').toLowerCase();
    final instLower = entry.institution.toLowerCase();

    if (titleLower.contains('abschluss') ||
        titleLower.contains('b.sc') ||
        titleLower.contains('bachelor') ||
        titleLower.contains('zertifikat') ||
        titleLower.contains('zertifizierung')) {
      return Icons.workspace_premium_outlined;
    }
    if (instLower.contains('schule') ||
        instLower.contains('gymnasium') ||
        instLower.contains('sand') ||
        instLower.contains('hochschule') ||
        instLower.contains('universität')) {
      return Icons.school_outlined;
    }
    return Icons.work_outline;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final icon = _getIconForEntry(widget.entry);

    final titleText = widget.entry.title ?? widget.entry.institution;
    final hasSeparateTitle = widget.entry.title != null;
    final location = widget.entry.location;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: widget.width,
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.colorScheme.surfaceContainer
              : theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? primaryColor.withValues(alpha: 0.55)
                : theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: primaryColor.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header: Icon Badge + Period Pill
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: primaryColor, size: 18),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant
                            .withValues(alpha: 0.35),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 11,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.entry.period,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // 2. Main Title
              Text(
                titleText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 6),

              // 3. Subtitle / Location Row
              Row(
                children: [
                  Icon(
                    hasSeparateTitle
                        ? Icons.business_outlined
                        : Icons.location_on_outlined,
                    size: 14,
                    color: hasSeparateTitle
                        ? primaryColor
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      hasSeparateTitle
                          ? '${widget.entry.institution}${location != null ? ' • $location' : ''}'
                          : (location ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: hasSeparateTitle
                            ? primaryColor
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: hasSeparateTitle
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              // 4. Description as Bullet Points
              if (widget.entry.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Divider(
                  height: 1,
                  color:
                      theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 10),
                ...widget.entry.description.map((point) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            point,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
