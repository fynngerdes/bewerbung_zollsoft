import 'package:flutter/material.dart';
import '../models/cv_entry_model.dart';

class CvCardWidget extends StatefulWidget {
  const CvCardWidget({super.key, required this.entry});

  final CvEntry entry;

  @override
  State<CvCardWidget> createState() => _CvCardWidgetState();
}

class _CvCardWidgetState extends State<CvCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 300,
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.colorScheme.surfaceContainer
              : theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? primaryColor.withValues(alpha: 0.55)
                : theme.colorScheme.outlineVariant,
            width: _isHovered ? 1.5 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(theme, primaryColor),
              const SizedBox(height: 14),
              _buildTitle(theme, widget.entry.title),
              const SizedBox(height: 6),
              _buildSubtitle(theme, primaryColor),
              if (widget.entry.description.isNotEmpty) ...[
                const SizedBox(height: 14),
                Divider(
                  height: 1,
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.45,
                  ),
                ),
                const SizedBox(height: 14),
                _buildDescriptionList(theme, primaryColor),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Header - Icon - Period
  Widget _buildHeader(ThemeData theme, Color primaryColor) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(widget.entry.icon, color: primaryColor, size: 20),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
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
    );
  }

  // Title
  Widget _buildTitle(ThemeData theme, String titleText) {
    return Text(
      titleText,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.35,
      ),
    );
  }

  // Subtitle - Location
  Widget _buildSubtitle(ThemeData theme, Color primaryColor) {
    final location = widget.entry.location;
    return Row(
      children: [
        Icon(Icons.business_outlined, size: 14, color: primaryColor),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            '${widget.entry.institution} • $location',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // Description
  Widget _buildDescriptionList(ThemeData theme, Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.entry.description.map((point) {
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
      }).toList(),
    );
  }
}
