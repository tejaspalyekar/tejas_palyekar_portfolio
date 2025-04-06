import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatefulWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final hasScreenshots = widget.project.screenshots != null &&
        widget.project.screenshots!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(_animation),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasScreenshots)
                    SizedBox(
                      height: 400,
                      child: Swiper(
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              widget.project.screenshots![index],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                        itemCount: widget.project.screenshots!.length,
                        pagination: const SwiperPagination(),
                        control: const SwiperControl(),
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.project.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 32),
                  Text(
                    widget.project.title,
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.project.longDescription ??
                        widget.project.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      height: 1.6,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (widget.project.keyHighlights != null &&
                      widget.project.keyHighlights!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Key Highlights",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge?.color,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: widget.project.keyHighlights!
                              .map((highlight) => Chip(
                                    label: Text(
                                      highlight,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                    backgroundColor: isDarkMode
                                        ? Colors.blue.withOpacity(0.2)
                                        : Colors.blue.withOpacity(0.1),
                                    side: BorderSide(
                                      color: isDarkMode
                                          ? Colors.blue[700]!
                                          : Colors.blue[300]!,
                                      width: 1,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  const SizedBox(height: 32),
                  Text(
                    "Technologies",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: widget.project.technologies
                        .map((tech) => Chip(
                              label: Text(
                                tech,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                              backgroundColor: isDarkMode
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 32),
                  _buildLinks(context, isDarkMode),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinks(BuildContext context, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Links",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            if (widget.project.playStoreUrl != null)
              _buildLinkButton(
                icon: Icons.android,
                label: "Play Store",
                onTap: () => _launchUrl(widget.project.playStoreUrl!),
                color: Colors.green,
                isDarkMode: isDarkMode,
              ),
            if (widget.project.appStoreUrl != null)
              _buildLinkButton(
                icon: Icons.apple,
                label: "App Store",
                onTap: () => _launchUrl(widget.project.appStoreUrl!),
                color: Colors.grey[800]!,
                isDarkMode: isDarkMode,
              ),
            if (widget.project.githubUrl != null)
              _buildLinkButton(
                icon: Icons.code,
                label: "GitHub",
                onTap: () => _launchUrl(widget.project.githubUrl!),
                color: Colors.blue,
                isDarkMode: isDarkMode,
              ),
            if (widget.project.pubDevUrl != null)
              _buildLinkButton(
                icon: Icons.api,
                label: "pub.dev",
                onTap: () => _launchUrl(widget.project.pubDevUrl!),
                color: Colors.blue[700]!,
                isDarkMode: isDarkMode,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildLinkButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
    required bool isDarkMode,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isDarkMode ? color.withOpacity(0.2) : color.withOpacity(0.1),
        foregroundColor: color,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
