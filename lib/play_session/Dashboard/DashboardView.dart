import 'package:flutter/material.dart';
import 'EmissionAnalysisView.dart'; // Import EmissionAnalysisView
import 'FinancialsView.dart'; // Import FinancialsView
// import 'graph.dart';
// import 'table.dart';
import 'package:go_router/go_router.dart';
import '../../style/my_button.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'FeedbackView.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            backgroundColor: Colors.white, // Set background color to white
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontFamily: "Poppins-SemiBold",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C2D57),
                      ),
                    ),
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C2D57),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Emissions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C2D57),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Financials',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C2D57),
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Color(0xFF0C2D57),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF0C2D57),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: "• Emissions have decreased by "),
                                      TextSpan(
                                        text: "2%",
                                        style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(text: " since last year and "),
                                      TextSpan(
                                        text: "5%",
                                        style: TextStyle(decoration: TextDecoration.underline),
                                      ),
                                      TextSpan(text: " since the start."),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF0C2D57),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: "• Operating has increased by "),
                                    TextSpan(
                                      text: "1%",
                                      style: TextStyle(decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(text: " and decreased by "),
                                    TextSpan(
                                      text: "2%",
                                      style: TextStyle(decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(text: " since the start."),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              // FeedbackView(),
                              // GraphView(),
                              Center( // Wrap the button in a Center widget
                                child: MyButton(
                                  onPressed: () {
                                    GoRouter.of(context).go('/play');
                                  },
                                  child: const Text('Back'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      EmissionAnalysisView(),
                      FinancialsView(),
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
