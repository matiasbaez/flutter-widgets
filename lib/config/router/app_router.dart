
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:widgets_app/presentation/screens/screens.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      routes: <RouteBase>[

        GoRoute(
          path: 'buttons',
          name: ButtonsScreen.name,
          builder: (BuildContext context, GoRouterState state) => const ButtonsScreen(),
        ),

        GoRoute(
          path: 'cards',
          name: CardsScreen.name,
          builder: (BuildContext context, GoRouterState state) => const CardsScreen(),
        ),

      ],
    ),
  ],
);