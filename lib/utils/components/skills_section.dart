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

    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.blue.withOpacity(0.05)
            : Colors.blue.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.code,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 16),
              Text(
                "Skills",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Technologies & tools I work with",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 32),
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
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skillsList.map((skill) {
              return _HoverableSkillChip(
                skill: skill,
                isDarkMode: isDarkMode,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _HoverableSkillChip extends StatefulWidget {
  final String skill;
  final bool isDarkMode;

  const _HoverableSkillChip({
    required this.skill,
    required this.isDarkMode,
  });

  @override
  State<_HoverableSkillChip> createState() => _HoverableSkillChipState();
}

class _HoverableSkillChipState extends State<_HoverableSkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isHovered
              ? (widget.isDarkMode ? Colors.blue[900] : Colors.blue[50])
              : (widget.isDarkMode
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.05)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? Theme.of(context).primaryColor
                : (widget.isDarkMode ? Colors.blue[700]! : Colors.blue[200]!),
            width: 1.5,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.skill,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isHovered ? FontWeight.w600 : FontWeight.w500,
                color: isHovered
                    ? Theme.of(context).primaryColor
                    : (widget.isDarkMode ? Colors.white : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
