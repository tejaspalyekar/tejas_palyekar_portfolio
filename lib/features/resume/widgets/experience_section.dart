import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildExperienceItem(
          context,
          company: 'Quantasis',
          position: 'Mobile App Developer',
          period: 'March 2024-Present',
          highlights: [
            'Led development and deployment of multiple cross-platform apps using Flutter, React Native, and Java',
            'Collaborated with Marico Ltd Mobility Team on Parachute Kalpavriksha (100K+ installs, 4.8)',
            'Developed and deployed Sales Force Management App for Probott',
            'Built and improved Aatmaya Farms apps with CI/CD via Fastlane',
            'Fixed bugs and optimized performance for Harrj (React Native)',
            'Led Food Fitness Project with two Flutter apps',
            'Built Caparol App for painters',
            'Mentored junior developers and participated in recruitment',
          ],
        ),
        const SizedBox(height: 16),
        _buildExperienceItem(
          context,
          company: 'Freelance',
          position: 'Mobile Developer',
          period: 'Jan 2025 – Present',
          highlights: [
            'Developed a custom app locker app with PIN-based access',
            'Implemented features like hide app from launcher, clear app data & uninstall app on incorrect PIN',
            'Added custom launcher experience and notification hiding',
          ],
        ),
        const SizedBox(height: 16),
        _buildExperienceItem(
          context,
          company: 'Quantasis',
          position: 'Mobile App Developer Intern',
          period: 'Jan 2024-March 2024',
          highlights: [
            'Developed Aatmaya Farms E-commerce apps from scratch',
            'Implemented Google Maps and Easebuzz payment gateway',
            'Deployed on both Play Store and App Store',
            'Achieved 500+ downloads with 4.9 rating',
          ],
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String company,
    required String position,
    required String period,
    required List<String> highlights,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        position,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  period,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...highlights.map((highlight) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.circle, size: 8),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          highlight,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
