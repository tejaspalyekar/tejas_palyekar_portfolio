import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          context,
          icon: Icons.email,
          label: 'Email',
          value: 'tejaspalyekar18@gmail.com',
          onTap: () => _launchUrl('mailto:tejaspalyekar18@gmail.com'),
        ),
        _buildContactItem(
          context,
          icon: Icons.phone,
          label: 'Mobile',
          value: '+918879340589',
          onTap: () => _launchUrl('tel:+918879340589'),
        ),
        _buildContactItem(
          context,
          icon: Icons.link,
          label: 'LinkedIn',
          value: 'linkedin.com/in/tejas-palyekar',
          onTap: () =>
              _launchUrl('https://www.linkedin.com/in/tejas-palyekar/'),
        ),
        _buildContactItem(
          context,
          icon: Icons.code,
          label: 'GitHub',
          value: 'github.com/TejasPalyekar',
          onTap: () => _launchUrl('https://github.com/TejasPalyekar'),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
