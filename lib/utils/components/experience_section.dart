import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style:
                GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ExperienceItem(
            title: "Mobile App Developer",
            company: "Quantasis",
            duration: "March 2024-Present",
            description:
                '''• Led development and deployment of multiple cross-platform apps using Flutter, React Native, and Java.
• Collaborated with Marico Ltd Mobility Team on Parachute Kalpavriksha (100K+ installs, 4.8).
• Maintained apps with SSL pinning, API key security, Firebase Crashlytics, and Google Analytics.
• Developed and deployed Sales Force Management App for Probott from scratch.
• Built and improved Aatmaya Farms apps with CI/CD via Fastlane.
• Fixed bugs and optimized performance for Harrj (React Native with Zoom SDK, Arabic support).
• Led Food Fitness Project with live/clinic appointments, payments, Jitsi SDK, and e-commerce features.
• Built Caparol App for painters with QR scanning and invoice upload features.
• Mentored junior developers and participated in Flutter developer recruitment.''',
          ),
          const Divider(),
          ExperienceItem(
            title: "Freelance Mobile Developer",
            company: "Self-employed",
            duration: "Jan 2025 – Present",
            description:
                '''• Developed a custom app locker app with PIN-based access.
• Implemented features to hide apps from launcher, clear app data & uninstall on incorrect PIN.
• Created custom launcher experience and notification hiding functionality.''',
          ),
          const Divider(),
          ExperienceItem(
            title: "Mobile App Developer Intern",
            company: "Quantasis",
            duration: "Jan 2024-March 2024",
            description:
                '''• Developed Aatmaya Farms E-commerce apps (Customer & Delivery Partner) from scratch.
• Implemented Google Maps, Easebuzz payment gateway using Platform Channels.
• Deployed on both Play Store and App Store with 500+ downloads and 4.9 rating.''',
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final String description;

  ExperienceItem({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title at $company",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(duration,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 10),
          Text(description, style: GoogleFonts.poppins(fontSize: 14)),
        ],
      ),
    );
  }
}
