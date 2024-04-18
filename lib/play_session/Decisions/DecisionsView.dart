import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'YearView.dart';

class DecisionsView extends StatelessWidget {
  const DecisionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 1.0, 5.0, 5.0), // Padding adjustment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0), // Adjusted top padding
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Decisions",
                      style: TextStyle(
                        fontFamily: "Poppins-SemiBold",
                        fontSize: 32,
                        fontWeight: FontWeight.bold, // Make it bold
                        color: Color(0xFF0C2D57), // Use the color code 0C2D57
                      ),
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: Color(0xFF0C2D57), // Set indicator color to 0C2D5
                  tabs: [
                    Tab(
                      child: Text(
                        'Decisions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Make it bold
                          color: Color(0xFF0C2D57), // Use the color code 0C2D57
                        ),
                      ),
                    ), // Change tab label to 'Decisions'
                    Tab(
                      child: Text(
                        'Year',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Make it bold
                          color: Color(0xFF0C2D57), // Use the color code 0C2D57
                        ),
                      ),
                    ), // Add a tab for 'Year'
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Content for Tab 1 (DecisionsView)
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Each year you select a maximum of three initiatives from the following categories:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF61677D), // Text color 61677D
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                CategoryItem(
                                  title: "• Energy:",
                                  description:
                                  "Projects that help to reduce energy consumption from the electricity grid or generate renewable energy.",
                                ),
                                CategoryItem(
                                  title: "• Purchasing:",
                                  description:
                                  "Projects that help to reduce water consumption, waste generation or the embodied carbon in other products and services that you purchase.",
                                ),
                                CategoryItem(
                                  title: "• Management:",
                                  description: "Actions that can impact the behavior of staff and guests.",
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0), // Add padding around the image
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                                      child: Image.asset(
                                        'assets/images/teamDecisions.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Note that there is no restriction on how the three selected initiatives are distributed between the categories of Energy, Purchasing, and Management. Decisions are made under each of the tabs (Energy, Purchasing, Management) and can be reviewed and confirmed in the Summary tab.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF61677D), // Text color 61677D
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 16.0), // Add some space between the text and the button
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.5, // Make button responsive
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0C2D57), // Set button color
                                      borderRadius: BorderRadius.circular(12.0), // Set border radius for soft edges
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        GoRouter.of(context).go('/play');
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white, // Set text color to white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Content for Tab 2 (YearView)
                      SingleChildScrollView(
                        child: YearView(), // Use YearView widget here
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String description;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFF08047), // Text color 61677D
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Color(0xFF61677D), // Text color 61677D
            ),
          ),
        ],
      ),
    );
  }
}
