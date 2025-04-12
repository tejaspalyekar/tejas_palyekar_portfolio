import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfessionalSummarySection extends StatefulWidget {
  const ProfessionalSummarySection({Key? key}) : super(key: key);

  @override
  State<ProfessionalSummarySection> createState() =>
      _ProfessionalSummarySectionState();
}

class _ProfessionalSummarySectionState
    extends State<ProfessionalSummarySection> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateCurrentIndex);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateCurrentIndex);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateCurrentIndex() {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.85;
    final newIndex = (_scrollController.offset / (cardWidth + 16)).round();
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final screenWidth = MediaQuery.maybeOf(context)?.size.width ?? 1200;
    final cardWidth = isDesktop
        ? ((screenWidth - 200).clamp(800, 1600) / 4)
        : screenWidth * 0.85;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 48.0 : 16.0),
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
                Icons.person_outline,
                size: isDesktop ? 32 : 24,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Professional Summary",
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 32 : 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildHighlight(
                      context,
                      icon: Icons.rocket_launch,
                      title: "Flutter Expert",
                      description:
                          "Expert Flutter developer with a track record of delivering high-performance apps, achieving 100K+ downloads and 4.8+ ratings through exceptional user experiences and robust architectures.",
                      width: cardWidth,
                      isDesktop: isDesktop,
                    ),
                    _buildHighlight(
                      context,
                      icon: Icons.code,
                      title: "Technical Leadership",
                      description:
                          "Led the successful development of 9 Flutter apps, showcasing expertise in complex app development while also delivering React Native and Native Android solutions.",
                      width: cardWidth,
                      isDesktop: isDesktop,
                    ),
                    _buildHighlight(
                      context,
                      icon: Icons.architecture,
                      title: "Architecture & Security",
                      description:
                          "Crafted secure and scalable architectures with SSL pinning, robust payment integrations, and seamless multi-language support for global users.",
                      width: cardWidth,
                      isDesktop: isDesktop,
                    ),
                    _buildHighlight(
                      context,
                      icon: Icons.integration_instructions,
                      title: "Integration Specialist",
                      description:
                          "Mastered the integration of modern technologies including Jitsi, Zoom SDK, Google Maps, and various payment gateways to create feature-rich applications.",
                      width: cardWidth,
                      isDesktop: isDesktop,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Stack(
                      children: [
                        SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              _buildHighlight(
                                context,
                                icon: Icons.rocket_launch,
                                title: "Flutter Expert",
                                description:
                                    "Expert Flutter developer with a track record of delivering high-performance apps, achieving 100K+ downloads and 4.8+ ratings through exceptional user experiences and robust architectures.",
                                width: cardWidth,
                                isDesktop: isDesktop,
                              ),
                              const SizedBox(width: 16),
                              _buildHighlight(
                                context,
                                icon: Icons.code,
                                title: "Technical Leadership",
                                description:
                                    "Led the successful development of 9 Flutter apps, showcasing expertise in complex app development while also delivering React Native and Native Android solutions.",
                                width: cardWidth,
                                isDesktop: isDesktop,
                              ),
                              const SizedBox(width: 16),
                              _buildHighlight(
                                context,
                                icon: Icons.architecture,
                                title: "Architecture & Security",
                                description:
                                    "Crafted secure and scalable architectures with SSL pinning, robust payment integrations, and seamless multi-language support for global users.",
                                width: cardWidth,
                                isDesktop: isDesktop,
                              ),
                              const SizedBox(width: 16),
                              _buildHighlight(
                                context,
                                icon: Icons.integration_instructions,
                                title: "Integration Specialist",
                                description:
                                    "Mastered the integration of modern technologies including Jitsi, Zoom SDK, Google Maps, and various payment gateways to create feature-rich applications.",
                                width: cardWidth,
                                isDesktop: isDesktop,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        if (_currentIndex > 0)
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset -
                                          (cardWidth + 16),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (_currentIndex < 3)
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      color: Colors.white),
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset +
                                          (cardWidth + 16),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 24),
          Text(
            "Currently at Quantasis, driving mobile innovation, mentoring talented developers, and setting new standards for code quality and app performance.",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 16 : 14,
              height: 1.6,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlight(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required double width,
    required bool isDesktop,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: isDesktop ? 220 : 220,
      padding: EdgeInsets.all(isDesktop ? 24 : 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.blue.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.blue.withOpacity(0.2)
              : Colors.blue.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: isDesktop ? 28 : 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 14 : 13,
                  height: 1.6,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
