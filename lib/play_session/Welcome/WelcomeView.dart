import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'my_button.dart';  // Ensure this import points to the correct file location
import '../../settings/custom_name_dialog.dart';
import '../../settings/settings.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> with SingleTickerProviderStateMixin {
  final TextEditingController _hotelNameController = TextEditingController();
  String selectedLocation = "";
  bool _showAlert = false;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C2D57),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: settings.nextLocation,
                // Assuming nextLocation is a ValueListenable<bool>
                builder: (context, nextLocationValue, child) {
                  return ListTile(
                    title: Text(nextLocationValue
                        ? "True"
                        : "False"), // Conditional text based on boolean value
                  );
                },
              ),
              ValueListenableBuilder<String>(
                valueListenable: settings.cityName,
                // Assuming nextLocation is a ValueListenable<bool>
                builder: (context, cityName, child) {
                  return ListTile(
                    title: Text(
                        cityName), // Conditional text based on boolean value
                  );
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: settings.currentYear,
                // Assuming nextLocation is a ValueListenable<bool>
                builder: (context, currentYear, child) {
                  return ListTile(
                    title: Text(
                        '$currentYear'), // Conditional text based on boolean value
                  );
                },
              ),

              Text(
                "In Carbon Strat you manage a 4-star city center hotel. Your goal is to reduce the hotel's greenhouse gas (GHG) emissions by 50% over a period of just 7 years, while at the same time managing the hotel's financial performance.",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                  children: [
                    const TextSpan(
                        text: 'Choose the location and a name for your hotel below. When you are ready to play, go to '),
                    TextSpan(
                      text: 'Decisions',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Choose the location of your hotel:",
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0C2D57),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () {},
                    ),
                    _buildLocationCard("London"),
                    const SizedBox(width: 15),
                    _buildLocationCard("New York"),
                    const SizedBox(width: 15),
                    _buildLocationCard("Singapore"),
                    const SizedBox(width: 15),
                    _buildLocationCard("Dubai"),
                    const SizedBox(width: 15),
                    _buildLocationCard("Sydney"),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const _NameChangeLine(
                'Name',
              ),
              const SizedBox(height: 30),
              MyButton(
                onPressed: () {
                  settings.toggleNextLocation();
                  settings.setCurrentYear();
                  GoRouter.of(context).go(
                      '/play'); // Proceed with navigation after toggling
                },
                child: const Text(
                  'Back to Main Menu',
                ),
              ),
              _showAlert
                  ? AlertDialog(
                title: const Text("Error"),
                content: const Text("Please enter the hotel name"),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showAlert = false;
                      });
                    },
                    child: const Text("OK"),
                  ),
                ],
              )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(String title) {
    bool isSelected = selectedLocation == title;
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontStyle: FontStyle.italic)),
            Image(image: AssetImage('assets/images/$title.jpg'),
                width: 150,
                height: 150),
            const SizedBox(height: 15),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              onPressed: () {
                setState(() {
                  if (isSelected) {
                    selectedLocation = ""; // Deselect if already selected
                    Provider.of<SettingsController>(context, listen: false)
                        .setCityName("");
                  } else {
                    selectedLocation = title; // Select new location
                    Provider.of<SettingsController>(context, listen: false).setCityName(title);
                  }
                });
              },
              child: isSelected
                  ? const Icon(Icons.check,
                  color: Colors.white) // Show checkmark if selected
                  : const Text('Choose', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

  class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontFamily: "Poppins-Regular",
                  fontSize: 24,
                  color:  Color(0xFF0C2D57),
                  fontWeight: FontWeight.w600,
                )),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: settings.playerName,
              builder: (context, name, child) => Text(
                '‘$name’',
                style: const TextStyle(
                  fontFamily: "Poppins-Regular",
                  fontSize: 24,
                  color:  Color(0xFF0C2D57),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}