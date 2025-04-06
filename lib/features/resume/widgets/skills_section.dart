import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills Summary',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Languages',
          skills: ['Dart', 'Java', 'JavaScript', 'SQL'],
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Frameworks',
          skills: [
            'Flutter',
            'Android SDK',
            'React Native',
            'Appium',
          ],
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Tools & DevOps',
          skills: [
            'Firebase',
            'State Management (Provider, Getx, Bloc)',
            'Git & GitHub/GitLab',
            'Fastlane',
            'GitHub Actions',
            'CodePush',
            'Jira',
            'OneSignal',
            'Figma',
            'Postman',
          ],
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Mobile Dev',
          skills: [
            'App Store Connect',
            'Google Play Console',
            'RESTful APIs',
            'Hive',
            'SharedPreferences',
            'Sqflite',
            'FlutterFlow',
            'MVVM & Clean Architecture',
            'RxDart',
          ],
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Platforms',
          skills: [
            'Android Studio',
            'Xcode',
            'Visual Studio Code',
          ],
        ),
        const SizedBox(height: 16),
        _buildSkillsCategory(
          context,
          title: 'Deployment',
          skills: [
            'Published 8 apps on Play Store & 3 apps on App Store',
          ],
        ),
      ],
    );
  }

  Widget _buildSkillsCategory(
    BuildContext context, {
    required String title,
    required List<String> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
