import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/layout.dart';
import '../presentation/home_page.dart';
import '../presentation/about_page.dart';
import '../presentation/services_page.dart';
import '../presentation/projects_page.dart';
import '../presentation/project_detail_page.dart';
import '../presentation/support_page.dart';
import '../presentation/contacts_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => const NoTransitionPage(child: AboutPage()),
        ),
        GoRoute(
          path: '/services',
          pageBuilder: (context, state) => const NoTransitionPage(child: ServicesPage()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => const NoTransitionPage(child: ProjectsPage()),
          routes: [
            GoRoute(
              path: ':slug',
              pageBuilder: (context, state) {
                final slug = state.pathParameters['slug']!;
                return NoTransitionPage(child: ProjectDetailPage(projectId: slug));
              },
            ),
          ],
        ),
        GoRoute(
          path: '/support',
          pageBuilder: (context, state) => const NoTransitionPage(child: SupportPage()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => const NoTransitionPage(child: ContactsPage()),
        ),
      ],
    ),
  ],
);
