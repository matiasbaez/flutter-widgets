
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
          path: 'animated',
          name: AnimatedScreen.name,
          builder: (BuildContext context, GoRouterState state) => const AnimatedScreen(),
        ),

        GoRoute(
          path: 'tutorial',
          name: AppTutorialScreen.name,
          builder: (BuildContext context, GoRouterState state) => const AppTutorialScreen(),
        ),

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

        GoRoute(
          path: 'counter',
          name: CounterScreen.name,
          builder: (BuildContext context, GoRouterState state) => const CounterScreen(),
        ),

        GoRoute(
          path: 'infinite',
          name: InfiniteScrollScreen.name,
          builder: (BuildContext context, GoRouterState state) => const InfiniteScrollScreen(),
        ),

        GoRoute(
          path: 'progress',
          name: ProgressScreen.name,
          builder: (BuildContext context, GoRouterState state) => const ProgressScreen(),
        ),

        GoRoute(
          path: 'snackbar',
          name: SnackbarScreen.name,
          builder: (BuildContext context, GoRouterState state) => const SnackbarScreen(),
        ),

        GoRoute(
          path: 'uicontrols',
          name: UiControlScreen.name,
          builder: (BuildContext context, GoRouterState state) => const UiControlScreen(),
        ),

      ],
    ),
  ],
);