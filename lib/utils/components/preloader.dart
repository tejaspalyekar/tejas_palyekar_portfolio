import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tejas_palyekar_portfolio/utils/components/splash_screen.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  bool _isLoading = true;

  @override
  void initState() { 
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    try {
      // Preload all assets
      await Future.wait([
        precacheImage(
            const AssetImage('assets/images/profile_image.jpeg'), context),
        precacheImage(
            const AssetImage('assets/images/kalpakrusha/kalpakrusha.png'),
            context),
        rootBundle.load('assets/lottie/scroll_down_lottie.json'),
        rootBundle.load('assets/lottie/light_scroll_down_lottie.json'),
        rootBundle.load('assets/icons/whatsAppIcon.png'),
        rootBundle.load('assets/icons/github_icon.png'),
        rootBundle.load('assets/icons/linkdine_icon.png'),
        rootBundle.load('assets/icons/gmail_icon.png'),
      ]);
    } catch (e) {
      debugPrint('Error preloading assets: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }
    return const SplashScreen();
  }
}
