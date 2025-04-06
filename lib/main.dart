import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tejas_palyekar_portfolio/config/route/route_config.dart';
import 'package:tejas_palyekar_portfolio/config/theme/theme.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';

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
      child: Consumer<HomePageViewModel>(
        builder: (context, homePageViewModel, child) => MaterialApp.router(
          themeMode:
              homePageViewModel.appTheme ? ThemeMode.dark : ThemeMode.light,
          themeAnimationStyle: AnimationStyle(
              curve: Curves.easeInOutCirc, duration: Durations.long2),
          theme: lightThemeData,
          darkTheme: darkThemeData,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ),
      ),
    );
  }
}
