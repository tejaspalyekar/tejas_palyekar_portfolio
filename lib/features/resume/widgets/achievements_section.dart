import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';

class ResumeAchievementsSection extends StatelessWidget {
  const ResumeAchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final achievements = viewModel.achievements;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        ...achievements.map((achievement) => _buildAchievementItem(
              context,
              title: achievement.title,
              organization: achievement.organization,
              date: achievement.date,
              description: achievement.description,
            )),
      ],
    );
  }

  Widget _buildAchievementItem(
    BuildContext context, {
    required String title,
    required String organization,
    required String date,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.emoji_events,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$organization • $date',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }
}
