class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? pubDevUrl;
  final bool featured;
  final List<String>? screenshots;
  final String? longDescription;
  final List<String>? keyHighlights;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.pubDevUrl,
    this.featured = false,
    this.screenshots,
    this.longDescription,
    this.keyHighlights,
  });
}
