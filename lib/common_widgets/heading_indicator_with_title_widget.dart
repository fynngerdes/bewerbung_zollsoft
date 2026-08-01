import 'package:flutter/material.dart';

class HeadingIndicatorWithTitleWidget extends StatelessWidget {
  const HeadingIndicatorWithTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 36,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: theme.textTheme.headlineLarge)),
      ],
    );
  }
}
