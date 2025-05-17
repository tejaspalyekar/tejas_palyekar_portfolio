import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:photo_view/photo_view.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body:
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          SizedBox(
            height: 300,
            child: _buildImageCarousel(context),
          ),
          // Project Info Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildProjectInfo(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Section
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            padding: const EdgeInsets.all(16.0),
            child: _buildImageCarousel(context),
          ),
        ),
        // Project Info Section
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildProjectInfo(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    // if (project.title == "Kalpavriksha") {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('${project.title} - Image 1'),
                    ),
                    body: PhotoView(
                      imageProvider: AssetImage(
                        project.imagePath,
                      ),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      backgroundDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Image.asset(
              project.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
    // } else {
    //   return Container(
    //     color: Theme.of(context).colorScheme.surfaceVariant,
    //     child: Center(
    //       child: Icon(
    //         Icons.image_not_supported,
    //         size: 48,
    //         color: Theme.of(context).colorScheme.onSurfaceVariant,
    //       ),
    //     ),
    //   );
    // }
  }

  Widget _buildProjectInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Store Links
        if (project.playStoreUrl != null || project.appStoreUrl != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                if (project.playStoreUrl != null)
                  if (project.playStoreUrl!.contains('pub.dev'))
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(project.playStoreUrl!),
                      icon: const Icon(Icons.inventory_2_outlined),
                      label: const Text('View on pub.dev'),
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(project.playStoreUrl!),
                      icon: const Icon(Icons.android),
                      label: const Text('Play Store'),
                    ),
                if (project.appStoreUrl != null) ...[
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () => _launchUrl(project.appStoreUrl!),
                    icon: const Icon(Icons.apple),
                    label: const Text('App Store'),
                  ),
                ],
              ],
            ),
          ),
        // Description
        Text(
          project.longDescription,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        // Technologies
        Text(
          'Technologies Used',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies
              .map((tech) => Chip(
                    label: Text(
                      tech,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ))
              .toList(),
        ),
        const SizedBox(height: 24),
        // Key Highlights
        Text(
          'Key Highlights',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ...project.keyHighlights.map((highlight) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      highlight,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
