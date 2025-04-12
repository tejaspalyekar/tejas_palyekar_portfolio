class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool featured;
  final String longDescription;
  final List<String> keyHighlights;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.featured = false,
    required this.longDescription,
    required this.keyHighlights,
  });
}
