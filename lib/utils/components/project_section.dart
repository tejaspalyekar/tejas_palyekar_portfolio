import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:tejas_palyekar_portfolio/features/project_detail/project_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final viewModel = Provider.of<HomePageViewModel>(context);
    final projects = viewModel.projects;

    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < mobileSize;
      bool isTab =
          constraints.maxWidth < tabSize && constraints.maxWidth > mobileSize;

      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Projects",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Showcasing my mobile app development work",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            const SizedBox(height: 20),
            isMobile
                ? SizedBox(
                    height: 450,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectCard(
                          project: projects[index],
                          isDarkMode: isDarkMode,
                        );
                      },
                      itemCount: projects.length,
                      viewportFraction: 0.85,
                      scale: 0.9,
                      pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.blue,
                          color: Colors.grey,
                        ),
                      ),
                      control: const SwiperControl(
                        color: Colors.blue,
                      ),
                    ),
                  )
                : isTab
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: projects[index],
                            isDarkMode: isDarkMode,
                          );
                        },
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: projects[index],
                            isDarkMode: isDarkMode,
                          );
                        },
                      ),
          ],
        ),
      );
    });
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isDarkMode;

  const ProjectCard({
    Key? key,
    required this.project,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'project-${widget.project.title}',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.02))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: widget.isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
                spreadRadius: _isHovered ? 2 : 1,
                blurRadius: _isHovered ? 15 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _showProjectDetail(context),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge?.color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.project.featured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Featured',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: widget.isDarkMode
                            ? Colors.grey[300]
                            : Colors.grey[700],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.technologies
                          .take(3)
                          .map((tech) => Chip(
                                label: Text(
                                  tech,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: widget.isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                backgroundColor: widget.isDarkMode
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
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () => _showProjectDetail(context),
                          icon: const Icon(Icons.info_outline, size: 16),
                          label: const Text("Details"),
                        ),
                        Row(
                          children: [
                            if (widget.project.playStoreUrl != null)
                              IconButton(
                                icon: const Icon(Icons.android),
                                onPressed: () =>
                                    _launchURL(widget.project.playStoreUrl!),
                                tooltip: 'Play Store',
                                color: Colors.green,
                              ),
                            if (widget.project.appStoreUrl != null)
                              IconButton(
                                icon: const Icon(Icons.apple),
                                onPressed: () =>
                                    _launchURL(widget.project.appStoreUrl!),
                                tooltip: 'App Store',
                                color: Colors.grey[700],
                              ),
                            if (widget.project.githubUrl != null)
                              IconButton(
                                icon: const Icon(Icons.code),
                                onPressed: () =>
                                    _launchURL(widget.project.githubUrl!),
                                tooltip: 'GitHub',
                                color: Colors.blue,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetail(BuildContext context) {
    final String projectId =
        widget.project.title.toLowerCase().replaceAll(' ', '-');
    context.go('/project/$projectId');
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
