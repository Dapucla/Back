import 'package:flutter/material.dart';

class EmissionAnalysisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Your WelcomeView content here
          Container(
            height: 1000, // Placeholder height, replace with actual content
            child: Center(
              child: Text('emissions'),
            ),
          ),
        ],
      ),
    );
  }
}
