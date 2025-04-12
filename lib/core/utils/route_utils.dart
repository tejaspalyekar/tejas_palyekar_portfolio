import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tejas_palyekar_portfolio/features/home/presentation/pages/home_page.dart';
import 'package:tejas_palyekar_portfolio/features/resume/presentation/pages/resume_page.dart';
import 'package:tejas_palyekar_portfolio/features/projects/presentation/pages/projects_page.dart';

class RouteUtils {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/resume',
        builder: (context, state) => const ResumePage(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectsPage(),
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    context.go(path);
  }

  static void navigateBack(BuildContext context) {
    context.pop();
  }
}
