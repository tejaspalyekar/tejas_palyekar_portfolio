import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeCertificatesSection extends StatelessWidget {
  const ResumeCertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final certificates = viewModel.certificates;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificates',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        ...certificates.map((certificate) => _buildCertificateItem(
              context,
              title: certificate.title,
              issuer: certificate.issuer,
              date: certificate.date,
              credentialUrl: certificate.credentialUrl,
            )),
      ],
    );
  }

  Widget _buildCertificateItem(
    BuildContext context, {
    required String title,
    required String issuer,
    required String date,
    String? credentialUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.workspace_premium,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$issuer • $date',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    if (credentialUrl != null) ...[
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => _launchUrl(credentialUrl),
                        child: Text(
                          'View Credential',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
