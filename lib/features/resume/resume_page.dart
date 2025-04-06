import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/config/theme/theme.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/achievements_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/certificates_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/education_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/experience_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/skills_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/contact_section.dart';
import 'package:go_router/go_router.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'TEJAS VIVEK PALYEKAR',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 40),
              const ContactSection(),
              const SizedBox(height: 40),
              const EducationSection(),
              const SizedBox(height: 40),
              const ExperienceSection(),
              const SizedBox(height: 40),
              const SkillsSection(),
              const SizedBox(height: 40),
              const ResumeCertificatesSection(),
              const SizedBox(height: 40),
              const ResumeAchievementsSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
