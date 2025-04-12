import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view/home_page.dart';
import 'package:tejas_palyekar_portfolio/features/home_page/view_model/home_page_view_model.dart';
import 'package:tejas_palyekar_portfolio/features/project_detail/project_detail_page.dart';
import 'package:tejas_palyekar_portfolio/features/resume/resume_page.dart';
import 'package:provider/provider.dart';

/// The route configuration.
final router = GoRouter(
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
      path: '/project/:id',
      builder: (context, state) {
        final projectId = state.pathParameters['id']!;
        final viewModel =
            Provider.of<HomePageViewModel>(context, listen: false);
        final project = viewModel.projects.firstWhere(
          (p) => p.title.toLowerCase().replaceAll(' ', '-') == projectId,
          orElse: () => viewModel.projects.first,
        );
        return ProjectDetailPage(project: project);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(
        'Page not found',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  ),
);
