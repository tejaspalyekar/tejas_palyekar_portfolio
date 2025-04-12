import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/config/theme/theme.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/achievements_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/certificates_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/education_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/experience_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/skills_section.dart';
import 'package:tejas_palyekar_portfolio/features/resume/widgets/contact_section.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => viewModel.downloadCv(),
            tooltip: 'Download Resume',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'TEJAS VIVEK PALYEKAR',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 32),
              const ContactSection(),
              const SizedBox(height: 32),
              const EducationSection(),
              const SizedBox(height: 32),
              const ExperienceSection(),
              const SizedBox(height: 32),
              const SkillsSection(),
              const SizedBox(height: 32),
              const ResumeCertificatesSection(),
              const SizedBox(height: 32),
              const ResumeAchievementsSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
