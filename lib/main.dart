import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tejas_palyekar_portfolio/config/route/route_config.dart';
import 'package:tejas_palyekar_portfolio/config/theme/theme.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:tejas_palyekar_portfolio/utils/components/preloader.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
        )
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          themeMode: Provider.of<HomePageViewModel>(context).appTheme
              ? ThemeMode.dark
              : ThemeMode.light,
          themeAnimationStyle: AnimationStyle(
              curve: Curves.easeInOutCirc, duration: Durations.long2),
          theme: lightThemeData,
          darkTheme: darkThemeData,
          debugShowCheckedModeBanner: false,
          home: const SplashScreenWrapper(),
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: Builder(
                builder: (context) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
              ),
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MaterialApp.router(
              themeMode: Provider.of<HomePageViewModel>(context).appTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              themeAnimationStyle: AnimationStyle(
                  curve: Curves.easeInOutCirc, duration: Durations.long2),
              theme: lightThemeData,
              darkTheme: darkThemeData,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Preloader();
  }
}
