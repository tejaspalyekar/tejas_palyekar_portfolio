import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs

class GetInTouchSection extends StatefulWidget {
  final bool isDarkMode;

  const GetInTouchSection({required this.isDarkMode});

  @override
  _GetInTouchSectionState createState() => _GetInTouchSectionState();
}

class _GetInTouchSectionState extends State<GetInTouchSection> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTab = constraints.maxWidth < tabSize;
        return Center(
          child: Consumer<HomePageViewModel>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: GestureDetector(
                    onTap: () => value.openEmail(),
                    child: AnimatedContainer(
                      width: MediaQuery.of(context).size.width - 80,
                      height: isTab ? 150 : 200,
                      duration: const Duration(milliseconds: 300),
                      transform: _isHovered
                          ? (Matrix4.identity()..scale(1.02))
                          : Matrix4.identity(),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: widget.isDarkMode ? 0 : 2,
                            color: widget.isDarkMode
                                ? Colors.transparent
                                : const Color.fromARGB(255, 43, 43, 43)),
                        color: widget.isDarkMode
                            ? const Color.fromARGB(255, 43, 43, 43)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(_isHovered ? 0.2 : 0.1),
                            spreadRadius: 3,
                            blurRadius: 15,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              "Get in Touch".toUpperCase(),
                              style: GoogleFonts.poppins(
                                fontSize: isTab ? 44 : 68,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: GestureDetector(
                      onTap: () => value.openEmail(),
                      child: AnimatedContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          duration: const Duration(milliseconds: 300),
                          transform: _isHovered
                              ? (Matrix4.identity()..scale(1.02))
                              : Matrix4.identity(),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(_isHovered ? 0.2 : 0.1),
                                spreadRadius: 3,
                                blurRadius: 15,
                              )
                            ],
                          ),
                          child: const Text("tejaspalyekar18@gmail.com")),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
