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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.project.title == "Kalpavriksha") ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/kalpakrusha/kalpakrusha.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
            ],
            Text(
              widget.project.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Technologies Used:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 8,
              children: widget.project.technologies
                  .map((tech) => Chip(label: Text(tech)))
                  .toList(),
            ),
            const SizedBox(height: 16),
            if (widget.project.playStoreUrl != null)
              ElevatedButton(
                onPressed: () =>
                    launchUrl(Uri.parse(widget.project.playStoreUrl!)),
                child: const Text('View on Play Store'),
              ),
            if (widget.project.appStoreUrl != null)
              ElevatedButton(
                onPressed: () =>
                    launchUrl(Uri.parse(widget.project.appStoreUrl!)),
                child: const Text('View on App Store'),
              ),
            const SizedBox(height: 16),
            Text(
              'Key Highlights:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...widget.project.keyHighlights.map((highlight) => ListTile(
                  leading: const Icon(Icons.star),
                  title: Text(highlight),
                )),
          ],
        ),
      ),
    );
  }
}
