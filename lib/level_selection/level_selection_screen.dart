import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../settings/settings.dart'; // Import your settings controller
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settings = context.watch<SettingsController>(); // Assuming this is how you access nextLocation

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Game Menu',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 44,
                    color: Color(0xFF0C2D57),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      if (settings.currentYear.value < 2) {
                        GoRouter.of(context).go('/welcome');
                      }
                    },
                    title: Text(
                      'Welcome View',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 24,
                        color: Color(0xFF0C2D57).withOpacity(settings.currentYear.value < 2 ? 1.0 : 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: settings.nextLocation.value ? () => GoRouter.of(context).go('/decisions') : null,
                    title: Text(
                      'Decisions View',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 24,
                        color: Color(0xFF0C2D57).withOpacity(settings.nextLocation.value ? 1.0 : 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: settings.nextLocation.value ? () => GoRouter.of(context).go('/dashboard') : null,
                    title: Text(
                      'Dashboard View',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 24,
                        color: Color(0xFF0C2D57).withOpacity(settings.nextLocation.value ?1.0 : 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: settings.nextLocation.value ? () => GoRouter.of(context).go('/glossary') : null,
                    title: Text(
                      'Glossary View',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 24,
                        color: Color(0xFF0C2D57).withOpacity(settings.nextLocation.value ? 1.0 : 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () => GoRouter.of(context).go('/'),
          child: const Text('Back to Main Menu'),
        ),
      ),
    );
  }
}
