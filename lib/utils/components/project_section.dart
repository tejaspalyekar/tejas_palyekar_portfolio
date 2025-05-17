import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:tejas_palyekar_portfolio/features/project_detail/project_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tejas_palyekar_portfolio/utils/components/project_detail_screen.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _showAllProjects = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final viewModel = Provider.of<HomePageViewModel>(context);
    final projects =
        _showAllProjects ? viewModel.projects : viewModel.initialProjects;
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final isTablet = ResponsiveBreakpoints.of(context).between(TABLET, DESKTOP);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: isDesktop ? 24.0 : 16.0),
          child: Text(
            _showAllProjects ? 'All Projects' : 'Projects',
            style: GoogleFonts.poppins(
              fontSize: isDesktop
                  ? 32
                  : isTablet
                      ? 28
                      : 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        if (isDesktop)
          _buildDesktopProjectGrid(projects, isDarkMode)
        // else if (isTablet)
        //   _buildTabletProjectGrid(projects, isDarkMode)
        else
          _buildMobileProjectList(projects, isDarkMode),
        if (!_showAllProjects && viewModel.projects.length > 6)
          Padding(
            padding: EdgeInsets.symmetric(vertical: isDesktop ? 32.0 : 24.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _showAllProjects = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.blue : Colors.blue,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 32,
                  vertical: isDesktop ? 20 : 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'View All Projects',
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 18 : 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileProjectList(List<Project> projects, bool isDarkMode) {
    return SizedBox(
      height: 380,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final project = projects[index];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            width: 280,
            child: _buildProjectCard(project, isDarkMode, true),
          );
        },
      ),
    );
  }

  Widget _buildTabletProjectGrid(List<Project> projects, bool isDarkMode) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isLandscape = screenWidth > 600;
        final cardWidth =
            (screenWidth - (isLandscape ? 64 : 48)) / (isLandscape ? 2 : 1);

        return GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 32 : 24,
            vertical: 16,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLandscape ? 2 : 1,
            childAspectRatio: isLandscape ? 1.1 : 1.0,
            crossAxisSpacing: isLandscape ? 24 : 16,
            mainAxisSpacing: isLandscape ? 24 : 16,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return _buildProjectCard(project, isDarkMode, false, cardWidth);
          },
        );
      },
    );
  }

  Widget _buildDesktopProjectGrid(List<Project> projects, bool isDarkMode) {
    return GridView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.35,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return _buildProjectCard(project, isDarkMode, false);
      },
    );
  }

  Widget _buildProjectCard(Project project, bool isDarkMode, bool isMobile,
      [double? cardWidth]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(project: project),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: SizedBox(
                  height: isMobile ? 160 : 220,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: PageController(viewportFraction: 1.0),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        project.imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.title,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (project.featured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Featured',
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 10 : 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          project.description,
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 12 : 14,
                            height: 1.5,
                            color: isDarkMode
                                ? Colors.grey[300]
                                : Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies.sublist(0, 3).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.grey[800]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tech,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 10 : 12,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (project.playStoreUrl != null)
                          IconButton(
                            icon: const Icon(Icons.android),
                            onPressed: () => launchUrl(
                              Uri.parse(project.playStoreUrl!),
                              mode: LaunchMode.externalApplication,
                            ),
                            iconSize: isMobile ? 18 : 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                          ),
                        if (project.appStoreUrl != null)
                          IconButton(
                            icon: const Icon(Icons.apple),
                            onPressed: () => launchUrl(
                              Uri.parse(project.appStoreUrl!),
                              mode: LaunchMode.externalApplication,
                            ),
                            iconSize: isMobile ? 18 : 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
