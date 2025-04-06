import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/certificate_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final achievements = viewModel.achievements;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Achievements",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Recognition and accomplishments",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 24),
          // Debug button to help identify visibility issues
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Showing ${achievements.length} achievements",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              return _buildAchievementItem(
                achievement: achievements[index],
                isDarkMode: isDarkMode,
                context: context,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem({
    required Achievement achievement,
    required bool isDarkMode,
    required BuildContext context,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 500 + (index * 100)),
        child: AnimatedSlide(
          offset: Offset.zero,
          duration: Duration(milliseconds: 500 + (index * 100)),
          curve: Curves.easeOutCubic,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        color: Colors.amber,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          achievement.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${achievement.organization} • ${achievement.date}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    achievement.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
