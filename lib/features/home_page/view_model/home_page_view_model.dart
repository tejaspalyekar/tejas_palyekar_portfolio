import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/certificate_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends ChangeNotifier {
  bool _isDarkTheme = true;
  bool cvLoading = false;
  bool _whatsappLoading = false;
  bool get appTheme => _isDarkTheme;
  bool get downloadLoading => cvLoading;
  bool get openWhatsAppLoading => _whatsappLoading;

  // Projects list ordered by impact and downloads
  List<Project> _projects = [
    Project(
      title: "Parachute Kalpavriksha",
      description:
          "App for farmers with 100K+ installs and 4.8 rating. Helps farmers manage crops, track expenses, and connect with experts.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "Firebase Crashlytics", "Google Analytics"],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.marico.kalpavriksha",
      featured: true,
      screenshots: [
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "Parachute Kalpavriksha is a farmer engagement app that helps bridge the gap between farmers and agricultural experts. It offers features like crop management, expense tracking, expert consultations, and knowledge sharing. The app has been highly successful with over 100,000 installs and a 4.8-star rating on the Play Store.",
      keyHighlights: [
        "SSL Pinning",
        "Firebase Crashlytics",
        "In-App Notifications",
        "Multilingual Support",
        "Offline Functionality"
      ],
    ),
    Project(
      title: "Food Fitness",
      description:
          "Healthcare app with appointment booking and e-commerce features. Connects users with nutritionists and fitness trainers.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "Jitsi SDK", "WebRTC", "Payment Integration"],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.foodfitness.app",
      featured: true,
      screenshots: [
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "Food Fitness is a comprehensive healthcare application that focuses on nutrition and fitness. Users can book appointments with nutritionists and fitness trainers, participate in live sessions using Jitsi SDK, purchase health products, and track their progress. The app includes both patient and doctor interfaces.",
      keyHighlights: [
        "Live Video Consultations",
        "PayU Payment Integration",
        "E-commerce Features",
        "Appointment Scheduling",
        "Health Tracking"
      ],
    ),
    Project(
      title: "Aatmaya Farms",
      description:
          "E-commerce app for organic products with delivery tracking and payment integration. Available on both Play Store and App Store.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "Firebase", "Google Maps", "Payment Gateway"],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.aatmayafarms.customer",
      appStoreUrl: "https://apps.apple.com/app/aatmaya-farms/id123456789",
      featured: true,
      screenshots: [
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "Aatmaya Farms is an e-commerce platform for organic products, featuring customer and delivery partner apps. The customer app allows users to browse products, place orders, track delivery, and make payments. The delivery partner app helps with efficient route planning and order management.",
      keyHighlights: [
        "Google Maps Integration",
        "Easebuzz Payment Gateway",
        "Real-time Delivery Tracking",
        "Order Management",
        "CI/CD with Fastlane"
      ],
    ),
    Project(
      title: "Caparol App",
      description:
          "App for painters to redeem points via QR scanning and invoice upload. Incentivizes painters to use Caparol products.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "QR Scanner", "API Integration"],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.caparol.app",
      screenshots: [
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "The Caparol App is designed for painters to earn and redeem points by scanning QR codes on Caparol products and uploading invoices. It features a user-friendly interface, QR scanning capabilities, invoice upload functionality, and a rewards catalog for point redemption.",
      keyHighlights: [
        "QR Code Scanning",
        "Invoice Upload & Verification",
        "Points System",
        "Rewards Catalog",
        "User Management"
      ],
    ),
    Project(
      title: "App Locker",
      description:
          "Custom app locker with PIN-based access and security features. Helps users protect their privacy by securing apps.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "Local Storage", "System Integration"],
      githubUrl: "https://github.com/TejasPalyekar/app-locker",
      screenshots: [
        "assets/images/profile_image.jpeg",
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "App Locker is a security application that allows users to protect their privacy by locking access to specific apps with a PIN. It includes features like hiding apps from the launcher, clearing app data on incorrect PIN attempts, and a custom launcher experience.",
      keyHighlights: [
        "PIN Protection",
        "App Hiding",
        "Security Measures",
        "Custom Launcher",
        "Notification Management"
      ],
    ),
    Project(
      title: "Release to Trigger",
      description:
          "Published Flutter package to detect release gestures. Available on pub.dev with comprehensive documentation.",
      imageUrl: "assets/images/profile_image.jpeg",
      technologies: ["Flutter", "Dart", "Package Development"],
      githubUrl: "https://github.com/TejasPalyekar/release_to_trigger",
      pubDevUrl: "https://pub.dev/packages/release_to_trigger",
      screenshots: [
        "assets/images/profile_image.jpeg",
      ],
      longDescription:
          "Release to Trigger is a Flutter package published on pub.dev that enables developers to detect when a user releases a gesture (like tapping or dragging). It provides customizable callbacks for release events, making it useful for creating intuitive user interactions and games.",
      keyHighlights: [
        "Custom Gesture Detection",
        "Flexible Configuration",
        "Comprehensive Documentation",
        "Example App",
        "MIT License"
      ],
    ),
  ];

  List<Certificate> _certificates = [
    Certificate(
      title: "The Complete Mobile Ethical Hacking Course",
      issuer: "Udemy",
      date: "April 2025",
      credentialUrl: "https://www.udemy.com/certificate/mobile-ethical-hacking",
    ),
    Certificate(
      title: "Flutter Development",
      issuer: "Google",
      date: "February 2024",
      credentialUrl: "https://developers.google.com/certification/flutter",
    ),
    Certificate(
      title: "Microsoft Dynamics 365 Training",
      issuer: "Promx",
      date: "October 2023",
      credentialUrl: "https://www.promx.net/certifications",
    ),
    Certificate(
      title: "Cyber Security",
      issuer: "PrepInsta",
      date: "July 2023",
      credentialUrl: "https://prepinsta.com/cyber-security-certification",
    ),
    Certificate(
      title: "Java Programming Master class",
      issuer: "Udemy",
      date: "March 2023",
      credentialUrl: "https://www.udemy.com/certificate/java-masterclass",
    ),
  ];

  List<Achievement> _achievements = [
    Achievement(
      title: "1st Place in Projectathon 2.0",
      organization: "National Level Project Competition",
      date: "2024",
      description:
          "Won first place for developing an innovative mobile application that addressed social challenges.",
    ),
    Achievement(
      title: "2nd Place in National Level Project Competition",
      organization: "APCOER",
      date: "2021",
      description:
          "Secured second position for a project on mobile security and privacy protection.",
    ),
    Achievement(
      title: "2nd Place in IT Diploma Final year",
      organization: "Pravin Patil Polytechnic",
      date: "2021",
      description:
          "Achieved second rank in the final year of IT diploma program.",
    ),
    Achievement(
      title: "Excellent Certificate in Python Programming",
      organization: "Internshala",
      date: "2022",
      description:
          "Received excellent grade certification for Python programming skills.",
    ),
  ];

  List<OpenSourceContribution> _openSourceContributions = [
    OpenSourceContribution(
      title: "Release to Trigger",
      description:
          "Created and published a Flutter package on pub.dev for capturing vertical swipes and triggering actions. Perfect for pull-to-refresh, swipe-to-access, and custom interactive UIs.",
      repoUrl: "https://github.com/TejasPalyekar/release_to_trigger",
      technologies: ["Flutter", "Dart", "Gesture Detection", "UI Components"],
      pullRequestUrl: "https://pub.dev/packages/release_to_trigger",
    ),
  ];

  // List of skills grouped by category
  final Map<String, List<String>> _skills = {
    "Mobile Development": [
      "Flutter",
      "Dart",
      "UI/UX Design",
      "Firebase",
      "State Management",
      "RESTful APIs",
      "WebRTC"
    ],
    "Programming Languages": ["Dart", "Java", "Python", "JavaScript"],
    "Tools & Technologies": [
      "Git",
      "Firebase",
      "CI/CD",
      "Fastlane",
      "Android Studio",
      "VS Code",
      "Jira"
    ],
    "Security": [
      "Mobile App Security",
      "SSL Pinning",
      "Secure Storage",
      "Authentication"
    ]
  };

  // Getters
  List<Project> get projects => _projects;
  List<Project> get featuredProjects =>
      _projects.where((project) => project.featured).toList();
  List<Certificate> get certificates => _certificates;
  List<Achievement> get achievements => _achievements;
  List<OpenSourceContribution> get openSourceContributions =>
      _openSourceContributions;
  Map<String, List<String>> get skills => _skills;

  // Theme toggle
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  updateTheme() {
    if (_isDarkTheme) {
      _isDarkTheme = false;
    } else {
      _isDarkTheme = true;
    }

    notifyListeners();
  }

  downloadCv() async {
    cvLoading = true;
    if (await canLaunchUrl(Uri.parse(cvUrl))) {
      await launchUrl(Uri.parse(cvUrl)); // Open the URL to download the PDF
      cvLoading = false;
    } else {
      cvLoading = false;
      throw 'Could not launch $cvUrl';
    }

    notifyListeners();
  }

  Future<void> openWhatsApp() async {
    final Uri uri = Uri.parse(Uri.encodeFull(whatsAppUrl));

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $whatsAppUrl';
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> openInstagram() async {
    final Uri uri = Uri.parse(Uri.encodeFull(instagramUrl));

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $instagramUrl';
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> openLinkdine() async {
    final Uri uri = Uri.parse(Uri.encodeFull(linkedinUrl));

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $linkedinUrl';
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> openEmail() async {
    final Uri uri = Uri.parse(Uri.encodeFull(emailUrl));

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $emailUrl';
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> openGithub() async {
    final Uri uri = Uri.parse(Uri.encodeFull(githubUrl));

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $githubUrl';
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
