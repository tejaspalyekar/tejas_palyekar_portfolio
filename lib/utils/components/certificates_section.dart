import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/model/certificate_model.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatesSection extends StatefulWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<CertificatesSection> {
  final ScrollController _scrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateArrows);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateArrows);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateArrows() {
    setState(() {
      _showLeftArrow = _scrollController.position.pixels > 0;
      _showRightArrow = _scrollController.position.pixels <
          _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.position.pixels - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.position.pixels + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    final certificates = viewModel.certificates;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Certificates",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Professional certifications and courses",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 24),
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: certificates.length,
                  itemBuilder: (context, index) {
                    return _buildCertificateItem(
                      certificate: certificates[index],
                      isDarkMode: isDarkMode,
                    );
                  },
                ),
              ),
              if (_showLeftArrow)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: FloatingActionButton.small(
                      heroTag: "certLeftBtn",
                      onPressed: _scrollLeft,
                      backgroundColor: isDarkMode
                          ? Colors.blueGrey[800]
                          : Colors.blueGrey[100],
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: isDarkMode ? Colors.white : Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              if (_showRightArrow)
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: FloatingActionButton.small(
                      heroTag: "certRightBtn",
                      onPressed: _scrollRight,
                      backgroundColor: isDarkMode
                          ? Colors.blueGrey[800]
                          : Colors.blueGrey[100],
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: isDarkMode ? Colors.white : Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateItem({
    required Certificate certificate,
    required bool isDarkMode,
  }) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
        child: InkWell(
          onTap: certificate.credentialUrl != null
              ? () => _launchUrl(certificate.credentialUrl!)
              : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        certificate.title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (certificate.credentialUrl != null)
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Issued by ${certificate.issuer}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      certificate.date,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                    if (certificate.credentialUrl != null)
                      TextButton.icon(
                        onPressed: () => _launchUrl(certificate.credentialUrl!),
                        icon: const Icon(Icons.link, size: 16),
                        label: const Text("View"),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
