class HomeModel {
  final String name;
  final String role;
  final String description;
  final List<String> skills;
  final List<ProjectModel> projects;

  const HomeModel({
    required this.name,
    required this.role,
    required this.description,
    required this.skills,
    required this.projects,
  });
}

class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final List<String> technologies;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.playStoreUrl,
    required this.appStoreUrl,
    required this.technologies,
  });
}
