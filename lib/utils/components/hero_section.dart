import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tejas_palyekar_portfolio/config/constants/app_constants.dart';
import 'package:tejas_palyekar_portfolio/config/constants/image_constants.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:typewritertext/typewritertext.dart';

class HeroSection extends StatefulWidget {
  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _imageController;
  late Animation<double> _textAnimation;
  late Animation<double> _imageAnimation;
  int _currentTextIndex = 0;

  // List of text to cycle through
  final List<String> _fadeTexts = [
    "I build amazing mobile apps",
    "I develop cross-platform solutions",
    "I create responsive and interactive UIs",
    "I bring your app ideas to life"
  ];

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _imageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    );

    _imageAnimation = CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOut,
    );

    _textController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            setState(() {
              _currentTextIndex = (_currentTextIndex + 1) % _fadeTexts.length;
            });
            _textController.forward(from: 0.0);
          }
        });
      }
    });

    _imageController.forward();
    _textController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, homeViewModel, child) => LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < mobileSize;
          bool isTab = constraints.maxWidth < tabSize &&
              constraints.maxWidth >= mobileSize;
          bool isDesktop = constraints.maxWidth >= tabSize;

          double imageSize = isMobile
              ? constraints.maxWidth * 0.4
              : isTab
                  ? constraints.maxWidth * 0.3
                  : constraints.maxWidth * 0.2;

          double titleFontSize = isMobile
              ? 32
              : isTab
                  ? 42
                  : 60;
          double subtitleFontSize = isMobile
              ? 18
              : isTab
                  ? 24
                  : 34;
          double bodyFontSize = isMobile
              ? 14
              : isTab
                  ? 16
                  : 18;

          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: homeViewModel.appTheme
                    ? [
                        const Color(0xFF1A1A2E),
                        const Color(0xFF16213E),
                      ]
                    : [
                        const Color(0xFFE8F0FE),
                        const Color(0xFFD7E3FC),
                      ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile || isTab
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ScaleTransition(
                            scale: _imageAnimation,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    profileImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          TypeWriter.text(
                            alignment: Alignment.center,
                            maxLines: 1,
                            softWrap: false,
                            "Hi, I'm Tejas Palyekar",
                            duration: const Duration(milliseconds: 100),
                            style: GoogleFonts.poppins(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: homeViewModel.appTheme
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeTransition(
                            opacity: _textAnimation,
                            child: Text(
                              _fadeTexts[_currentTextIndex],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.w500,
                                color: homeViewModel.appTheme
                                    ? Colors.blue[300]
                                    : Colors.blue[700],
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          Text(
                            softWrap: true,
                            'Passionate and results-driven Flutter developer with strong expertise in building fast, scalable, and user-friendly cross-platform mobile applications. I have successfully delivered apps across diverse industries, including FMCG, Healthcare, Consumer Loyalty & Rewards, Online Auctions, Security, and Sales Force Automation (SFA). With a deep understanding of clean architecture (MVVM/MVC), state management(Provider,Getx & Bloc), and performance optimization techniques, I ensure high-quality code, intuitive UI/UX, and seamless cross-platform functionality.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              fontSize: bodyFontSize,
                              color: homeViewModel.appTheme
                                  ? Colors.white70
                                  : Colors.black54,
                              height: 1.6,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TypeWriter.text(
                                  softWrap: false,
                                  "Hi, I'm Tejas Palyekar",
                                  duration: const Duration(milliseconds: 100),
                                  style: GoogleFonts.poppins(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: homeViewModel.appTheme
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                FadeTransition(
                                  opacity: _textAnimation,
                                  child: Text(
                                    _fadeTexts[_currentTextIndex],
                                    style: GoogleFonts.poppins(
                                      fontSize: subtitleFontSize,
                                      fontWeight: FontWeight.w500,
                                      color: homeViewModel.appTheme
                                          ? Colors.blue[300]
                                          : Colors.blue[700],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 35),
                                Text(
                                  softWrap: true,
                                  'Passionate and results-driven Flutter developer with strong expertise in building fast, scalable, and user-friendly cross-platform mobile applications. I have successfully delivered apps across diverse industries, including FMCG, Healthcare, Consumer Loyalty & Rewards, Online Auctions, Security, and Sales Force Automation (SFA). With a deep understanding of clean architecture (MVVM/MVC), state management(Provider,Getx & Bloc), and performance optimization techniques, I ensure high-quality code, intuitive UI/UX, and seamless cross-platform functionality.',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.poppins(
                                    fontSize: bodyFontSize,
                                    color: homeViewModel.appTheme
                                        ? Colors.white70
                                        : Colors.black54,
                                    height: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed: () => context.go('/resume'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: homeViewModel.appTheme
                                        ? Colors.blue[700]
                                        : Colors.blue[600],
                                  ),
                                  child: Text(
                                    'View Resume',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            flex: 3,
                            child: ScaleTransition(
                              scale: _imageAnimation,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      profileImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      icon: linkdineIcon,
                      onPressed: () => homeViewModel.openLinkdine(),
                      tooltip: 'LinkedIn',
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      icon: githubIcon,
                      onPressed: () => homeViewModel.openGithub(),
                      tooltip: 'GitHub',
                      color:
                          homeViewModel.appTheme ? Colors.white : Colors.black,
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      icon: emailIcon,
                      onPressed: () => homeViewModel.openEmail(),
                      tooltip: 'Email',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required VoidCallback onPressed,
    required String tooltip,
    Color? color,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          splashColor: Colors.blue.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              icon,
              width: 24,
              height: 24,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
