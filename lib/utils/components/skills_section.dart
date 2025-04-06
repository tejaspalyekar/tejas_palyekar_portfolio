import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final skills = viewModel.skills;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Technologies & tools I work with",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 24),
          ...skills.entries.map((entry) => _buildSkillCategory(
                context,
                category: entry.key,
                skillsList: entry.value,
                isDarkMode: isDarkMode,
              )),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context, {
    required String category,
    required List<String> skillsList,
    required bool isDarkMode,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skillsList.map((skill) {
              return Chip(
                label: Text(
                  skill,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                backgroundColor: isDarkMode
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.blue.withOpacity(0.1),
                side: BorderSide(
                  color: isDarkMode ? Colors.blue[700]! : Colors.blue[300]!,
                  width: 1,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
