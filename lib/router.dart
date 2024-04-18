import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/play_session/Welcome/WelcomeView.dart';
import '/play_session/Dashboard/DashboardView.dart';
import '/play_session/Decisions/DecisionsView.dart';
import '/play_session/Glossary/GlossaryView.dart';
import 'level_selection/level_selection_screen.dart';
import 'style/palette.dart';
import 'main_menu/main_menu_screen.dart';
import 'settings/settings_screen.dart';
import 'style/my_transition.dart';

/// The router describes the game's navigational hierarchy, from the main
/// screen through to the different views.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
          path: 'play',
          builder: (context, state) => const LevelSelectionScreen(),
        ),
        GoRoute(
          path: 'welcome',
          builder: (context, state) => WelcomeView(key: Key('welcome')),
        ),
        GoRoute(
          path: 'decisions',
          builder: (context, state) => DecisionsView(key: Key('decisions')),
        ),
        GoRoute(
          path: 'dashboard',
          builder: (context, state) => DashboardView(key: Key('dashboard')),
        ),
        GoRoute(
          path: 'glossary',
          builder: (context, state) => GlossaryView(key: Key('glossary')),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => SettingsScreen(key: Key('settings')),
        ),
      ],
    ),
  ],
);

