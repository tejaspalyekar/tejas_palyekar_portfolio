import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/certificate_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends ChangeNotifier {
  bool _isDarkTheme = true;
  bool cvLoading = false;
  final bool _whatsappLoading = false;
  bool get appTheme => _isDarkTheme;
  bool get downloadLoading => cvLoading;
  bool get openWhatsAppLoading => _whatsappLoading;

  // Projects list ordered by impact and downloads
  final List<Project> _projects = [
    Project(
      title: "Kalpavriksha",
      description:
          "India's #1 app for Coconut Farmers with 100K+ downloads. Features include real-time COPRA pricing, Google & Apple login support, multilingual support, farmer & trader role, weather updates, government scheme, fertilizer calculator, Ask an expert and many more features",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "FCM Notifications",
        "Google Analytics",
        'Google Crashlytics',
        'Open Weather Api Integration',
        "CI/CD",
        "Appium for Automation testing"
            "Google & Apple Login",
        "MVC Architecture"
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.pkf.kalpavriksha",
      appStoreUrl: "https://apps.apple.com/in/app/kalpavriksha/id6472012000",
      featured: true,
      longDescription:
          "India's #1 app for Coconut Farmers with 100K+ downloads. Features include real-time COPRA pricing, Google & Apple login support, multilingual support, farmer & trader role, weather updates, government scheme, fertilizer calculator, Ask an expert and many more features. Kalpavriksha is designed to help manage farmer products(coconut) effectively and increase productivity through industry best practices. The app provides daily COPRA pricing updates and real-time expert consultation via helpline (1800264646). It serves as a platform connecting farmers and traders for price discovery and trading of coconuts and related products. The app features market prices, multilingual support, and is specifically designed for Indian coconut farmers, completely free of cost.",
      keyHighlights: [
        "100K+ Downloads",
        "Real-time COPRA Pricing Updates",
        "Ticket Support",
        "Farmer-Trader Marketplace",
        "Multilingual Support",
        "Daily Price Notifications",
        "Modular & Scalable Codebase",
        " Beautiful UI with Best-in-Class UX",
        "Easy Login",
      ],
      imagePath: 'assets/images/kalpakrusha/mock_up_pkf.png',
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Aatmaya Farms",
      description:
          "E-commerce app connecting urban consumers to organic farm products. Features real-time inventory, Google Maps integration, in-app wallet, subscriptions, and multi-language support.",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "Firebase",
        "Google Maps",
        "Payment Gateway",
        "Fastlane Automation"
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.milkeshav.aatmaya",
      appStoreUrl: "https://apps.apple.com/in/app/aatmaya-farms/id6532603037",
      featured: true,
      longDescription:
          "Aatmaya Farms is an e-commerce platform that connects urban consumers directly to organic farm products. The app features real-time inventory management, Google Maps integration for delivery tracking, in-app wallet for seamless payments, subscription services for regular deliveries, and multi-language support (English, Hindi). The project includes both customer and delivery partner apps with Fastlane integration for automated deployment.",
      keyHighlights: [
        "Google Maps Integration",
        "Easebuzz Payment Gateway",
        "Real-time Delivery Tracking",
        "Order Management",
        "CI/CD with Fastlane",
        "500+ Downloads",
        "4.9 Rating",
        "Modular & Scalable Codebase",
        " Beautiful UI with Best-in-Class UX",
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Aatmaya Farms Delivery Partner",
      description:
          "Built for delivery agents & distributors. Features include delivery scheduling, real-time updates, role-based login, delivery order rearrangement, and performance tracking.",
      technologies: [
        "Flutter(Android)",
        "Getx for State Management"
            "Firebase Notifications",
        "Fastlane Automation"
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.milkeshav.aatmayafarms_delivery",
      featured: true,
      longDescription:
          "The Aatmaya Farms Delivery Partner app is designed for delivery agents and distributors. It includes features like delivery scheduling, real-time order updates, role-based login, the ability to rearrange delivery orders, and performance tracking. The app is integrated with Fastlane for automated deployment and testing.",
      keyHighlights: [
        "Delivery Scheduling",
        "Real-time Updates",
        "Route Optimization",
        "Performance Tracking",
        "CI/CD with Fastlane"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Food Fitness Doctor App",
      description:
          "Healthcare platform for doctors. Features include live/clinic appointments, PayU payments, Jitsi SDK, WebRTC, and e-commerce features.",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "Jitsi SDK",
        "WebRTC",
        "PayU",
        "Firebase"
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.foodFitness.doctor",
      featured: true,
      longDescription:
          "Food Fitness Doctor App is a comprehensive healthcare platform for medical professionals. The platform enables live and clinic appointments, integrates PayU for secure payments, uses Jitsi SDK for video consultations, and includes e-commerce features for health products.",
      keyHighlights: [
        "Live Video Consultations",
        "Appointment Scheduling",
        "Secure Payments",
        "E-commerce Integration",
        "Real-time Chat"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Food Fitness",
      description:
          "Patient-facing app for booking appointments, video consultations, and purchasing health products.",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "Jitsi SDK",
        "PayU",
        "Firebase"
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.food_fitness.patient",
      featured: true,
      longDescription:
          "Food Fitness is a patient-facing application that allows users to book appointments with doctors, attend video consultations, purchase health products, and track their health journey. The app features a user-friendly interface and secure payment integration.",
      keyHighlights: [
        "Appointment Booking",
        "Video Consultations",
        "Health Product Store",
        "Health Tracking",
        "Secure Payments"
      ],
    ),
    Project(
      imagePath: 'assets/images/caparol/caparol.png',
      title: "Caparol Club",
      description:
          "A multilingual, earn-and-redeem mobile rewards application built for Caparol, a leading German paint company. The app enables painters to scan product QR codes and upload invoices to earn reward points that can be redeemed via bank transfer or gift coupons.",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "MVVM Architecture",
        "Firebase (Google Analytics, Cloud Messaging, In-App Messaging)",
        "English & Arabic with RTL/LTR layout handling",
        "Dio for REST APIs Integration",
        "Provider for state management"
      ],
      featured: false,
      longDescription:
          "Caparol Club is a reward-based mobile application designed for Caparol, one of Germany's top paint manufacturers. Tailored specifically for professional painters, the app allows users to accumulate points by scanning QR codes on paint cans and uploading purchase invoices. These points are credited to their in-app wallet and can be redeemed directly into their bank accounts or used to purchase exclusive coupons and offers. The app offers a seamless multilingual experience with support for both English (LTR) and Arabic (RTL), automatically adjusting alignment and layout based on the selected language. Firebase powers the real-time notification system and in-app messaging to keep users informed and engaged. The app was developed using the MVVM architecture, ensuring maintainability, scalability, and adherence to clean coding standards. With an intuitive user interface and user-focused experience, the app delivers excellent performance and usability across different regions",
      keyHighlights: [
        "QR Code Scanning",
        "Multi-language Support",
        "Push Notifications & In-App Messaging",
        "Invoice Upload System",
        "Reward Redemption",
        "Modular & Scalable Codebase",
        " Beautiful UI with Best-in-Class UX",
        "Secure Authentication & Wallet System"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "App Locker",
      description:
          "Custom app locker with PIN-based access, hide app from launcher, clear app data & uninstall app on incorrect PIN, hide notifications of hidden apps, and custom launcher experience.",
      technologies: [
        "Flutter (Cross-platform for Android & iOS)",
        "Android Native",
        "Security",
        "Custom Launcher",
        "MVVM Architecture",
        "Provider for State Management"
      ],
      featured: true,
      longDescription:
          "A custom app locker application with advanced security features. The app allows users to protect their applications with a PIN, hide apps from the launcher, automatically clear app data and uninstall on incorrect PIN attempts, hide notifications from protected apps, and provides a custom launcher experience.",
      keyHighlights: [
        "PIN-based Access",
        "App Hiding",
        "Auto Data Clear",
        "Notification Control",
        "Custom Launcher"
      ],
    ),
    Project(
      imagePath:
          'assets/images/release_to_trigger/mock_up_release_to_trigger.png',
      title: "Release to Trigger",
      description:
          "release_to_trigger is a powerful Flutter widget designed to capture vertical and horizontal swipe gestures and trigger custom actions when users pull and release the swipe at a defined height.",
      technologies: [
        "Flutter",
        "Dart",
        "Cross-Platform",
        "Gesture Detection",
        "UI Components"
      ],
      featured: true,
      playStoreUrl: "https://pub.dev/packages/release_to_trigger",
      longDescription:
          "release_to_trigger is a powerful Flutter widget designed to capture vertical and horizontal swipe gestures and trigger custom actions when users pull and release the swipe at a defined height. With support for both top and bottom swipe gestures, it's perfect for building interactive UIs, pull-to-refresh controls, or custom trigger actions like loading new content or activating specific app features.",
      keyHighlights: [
        "Cross-Platform Support",
        "Vertical Swipe Detection",
        "Custom Action Triggers",
        "Pull-to-refresh",
        "Haptic Feedback",
        "Customizable Appearance",
        "Spring Animations"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Probott SFA",
      description:
          "Sales Force Automation tool supporting real-time order processing, CRM, store visits, offline access, and sales tracking.",
      technologies: [
        "Flutter",
        "Bloc Architecture",
        "Bloc State management",
        "Dio for api integration"
            "Firebase Notifications",
        "Offline First",
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.probott.sfa",
      featured: false,
      longDescription:
          "Probott SFA is a comprehensive Sales Force Automation tool designed for field sales teams. It supports real-time order processing, customer relationship management, store visit tracking, offline data access, and comprehensive sales analytics.",
      keyHighlights: [
        "Real-time Order Processing",
        "CRM Integration",
        "Offline Functionality",
        "Store Visit Tracking",
        "Sales Analytics"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "N2C",
      description:
          "Native Android app for N2C Copra with bug fixes, improvements, and deployment.",
      technologies: ["Java", "Android SDK", "Firebase"],
      featured: false,
      longDescription:
          "N2C is a native Android application developed in Java. The project involved implementing bug fixes, performance improvements, and managing the deployment process.",
      keyHighlights: [
        "Native Android Development",
        "Performance Optimization",
        "Bug Fixes",
        "Deployment Management"
      ],
    ),
    Project(
      imagePath: 'assets/images/Image-Placeholder.png',
      title: "Harrj",
      description:
          "Online auction app supporting both regular and live bidding via Zoom. Features include bid history, seller/buyer feedback, and multi-language support (English, Arabic).",
      technologies: ["React Native", "Zoom SDK", "Firebase", "Multi-language"],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.harrj.app",
      appStoreUrl: "https://apps.apple.com/in/app/harrj/id1234567890",
      featured: false,
      longDescription:
          "Harrj is an online auction platform that supports both regular bidding and live bidding via Zoom integration. The app features comprehensive bid history tracking, seller/buyer feedback systems, and multi-language support for English and Arabic users.",
      keyHighlights: [
        "Live Auction Integration",
        "Bid History Tracking",
        "Multi-language Support",
        "User Feedback System",
        "Real-time Updates"
      ],
    ),
  ];

  final List<Certificate> _certificates = [
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

  final List<Achievement> _achievements = [
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

  final List<OpenSourceContribution> _openSourceContributions = [
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
      "React Native",
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
      "Fastlane Automation",
      "Android Studio",
      "VS Code",
      "Jira",
      "Google Maps",
      "Zoom SDK",
      "Jitsi SDK"
    ],
    "Security & Payments": [
      "Mobile App Security",
      "SSL Pinning",
      "Secure Storage",
      "Authentication",
      "PayU Integration",
      "Easebuzz Integration"
    ],
    "Deployment & Distribution": [
      "Play Store Deployment",
      "App Store Deployment",
      "Fastlane Automation",
      "CI/CD Pipeline",
      "App Signing"
    ]
  };

  // Getters
  List<Project> get projects => _projects;
  List<Project> get featuredProjects =>
      _projects.where((p) => p.featured).toList();
  List<Project> get initialProjects => _projects.take(6).toList();
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
