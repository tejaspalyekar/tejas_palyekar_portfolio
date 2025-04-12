import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home/presentation/view_models/home_view_model.dart';
import 'package:tejas_palyekar_portfolio/features/home/presentation/widgets/hero_section.dart';
import 'package:tejas_palyekar_portfolio/features/home/presentation/widgets/skills_section.dart';
import 'package:tejas_palyekar_portfolio/features/home/presentation/widgets/projects_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().loadHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.homeData == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(data: viewModel.homeData!),
                SkillsSection(skills: viewModel.homeData!.skills),
                ProjectsSection(projects: viewModel.homeData!.projects),
              ],
            ),
          );
        },
      ),
    );
  }
}
