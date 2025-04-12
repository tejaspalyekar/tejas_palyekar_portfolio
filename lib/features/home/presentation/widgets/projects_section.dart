import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/features/home/domain/models/home_model.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        // TODO: Implement project grid/list
        const Placeholder(),
      ],
    );
  }
}
