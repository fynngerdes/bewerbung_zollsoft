import '../widgets/self_assessment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/hello_zollsoft_header_widget.dart';
import '../widgets/hello_zollsoft_pitch_widget.dart';
import '../widgets/hello_zollsoft_roadmap_widget.dart';

class HelloZollsoftPage extends ConsumerWidget {
  const HelloZollsoftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 32.0,
            vertical: 32.0,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelloZollsoftHeaderWidget(),
              SizedBox(height: 30),
              HelloZollsoftPitchWidget(),
              SizedBox(height: 30),
              HelloZollsoftRoadmapWidget(),
              SizedBox(height: 30),
              SelfAssessmentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
