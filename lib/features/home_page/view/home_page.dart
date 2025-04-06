import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/config/constants/image_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:tejas_palyekar_portfolio/utils/components/achievements_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/certificates_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/get_in_touch.dart';
import 'package:tejas_palyekar_portfolio/utils/components/experience_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/hero_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/opensource_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/project_section.dart';
import 'package:tejas_palyekar_portfolio/utils/components/skills_section.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>( 
      builder: (context, homePageViewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Tejas Palyekar'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => context.go('/resume'),
            ),
            IconButton(
              icon: Icon(
                homePageViewModel.appTheme ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () => homePageViewModel.toggleTheme(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroSection(),
              const SizedBox(height: 40),
              const SkillsSection(),
              const SizedBox(height: 40),
              const ProjectsSection(),
              const SizedBox(height: 40),
              ExperienceSection(),
              const SizedBox(height: 40),
              const CertificatesSection(),
              const SizedBox(height: 40),
              const AchievementsSection(),
              const SizedBox(height: 40),
              const OpenSourceSection(),
              const SizedBox(height: 40),
              GetInTouchSection(
                isDarkMode: homePageViewModel.appTheme,
              ),
              _footer(),
            ],
          ),
        ),
        floatingActionButton: IconButton(
          tooltip: "Send Message",
          onPressed: () => homePageViewModel.openWhatsApp(),
          icon: Image.asset(
            whatsappIcon,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

_footer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    alignment: Alignment.bottomRight,
    child: Text("© 2024 Tejas Palyekar. All rights reserved.",
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
  );
}
