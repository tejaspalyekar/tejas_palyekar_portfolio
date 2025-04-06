class Certificate {
  final String title;
  final String issuer;
  final String date;
  final String? credentialUrl;
  final String? imageUrl;

  Certificate({
    required this.title,
    required this.issuer,
    required this.date,
    this.credentialUrl,
    this.imageUrl,
  });
}

class Achievement {
  final String title;
  final String organization;
  final String date;
  final String description;
  final String? imageUrl;

  Achievement({
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
    this.imageUrl,
  });
}

class OpenSourceContribution {
  final String title;
  final String description;
  final String repoUrl;
  final List<String> technologies;
  final String? pullRequestUrl;

  OpenSourceContribution({
    required this.title,
    required this.description,
    required this.repoUrl,
    required this.technologies,
    this.pullRequestUrl,
  });
}
