import 'package:flutter/material.dart';

class ContactButtonWidget extends StatelessWidget {
  const ContactButtonWidget({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon, size: 20),
        onPressed: onTap,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) {
              return theme.colorScheme.primary;
            }
            return theme.colorScheme.onSurfaceVariant;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) {
              return theme.colorScheme.primary.withValues(alpha: 0.18);
            }
            return theme.colorScheme.primary.withValues(alpha: 0.12);
          }),
          padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        ),
      ),
    );
  }
}
