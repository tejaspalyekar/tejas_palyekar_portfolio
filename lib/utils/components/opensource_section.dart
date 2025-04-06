import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/certificate_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenSourceSection extends StatelessWidget {
  const OpenSourceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final contributions = viewModel.openSourceContributions;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Open Source",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Packages published on pub.dev",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;

              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: contributions.map((contribution) {
                        return Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: _buildContributionCard(
                              contribution: contribution,
                              isDarkMode: isDarkMode,
                              context: context,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Column(
                      children: contributions.map((contribution) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: _buildContributionCard(
                            contribution: contribution,
                            isDarkMode: isDarkMode,
                            context: context,
                          ),
                        );
                      }).toList(),
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContributionCard({
    required OpenSourceContribution contribution,
    required bool isDarkMode,
    required BuildContext context,
  }) {
    return Hero(
      tag: 'opensource-${contribution.title}',
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
        child: InkWell(
          onTap: () => _launchUrl(contribution.repoUrl),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.code,
                      color: Colors.blue,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        contribution.title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  contribution.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: contribution.technologies
                      .map((tech) => Chip(
                            label: Text(
                              tech,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color:
                                    isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            backgroundColor: isDarkMode
                                ? Colors.grey[800]
                                : Colors.grey[200],
                            padding: EdgeInsets.zero,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 0,
                            ),
                            visualDensity: VisualDensity.compact,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => _launchUrl(contribution.repoUrl),
                      icon: const Icon(Icons.link, size: 16),
                      label: const Text("Repository"),
                    ),
                    if (contribution.pullRequestUrl != null)
                      TextButton.icon(
                        onPressed: () =>
                            _launchUrl(contribution.pullRequestUrl!),
                        icon: const Icon(Icons.api, size: 16),
                        label: const Text("pub.dev"),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
