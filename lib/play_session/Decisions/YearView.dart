import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../style/my_button.dart';
import '../../settings/settings.dart';

class YearView extends StatefulWidget {
  @override
  _YearViewState createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
  List<Initiative> _initiatives = [];
  List<String> _selectedInitiativeIds = [];
  int _selectedCount = 0;
  int currentYear = 1; // State variable to keep track of the current year

  @override
  void initState() {
    super.initState();
    _loadInitiatives();
  }

  Future<void> _loadInitiatives() async {
    String data = await rootBundle.loadString('assets/data/Initiatives.json');
    List<dynamic> jsonList = json.decode(data) as List<dynamic>;
    List<Initiative> allInitiatives = jsonList.where((item) => item is Map<String, dynamic>).map((json) => Initiative.fromJson(json as Map<String, dynamic>)).toList();

    allInitiatives.shuffle();
    setState(() {
      _initiatives = allInitiatives.take(5).toList();
      _selectedInitiativeIds.clear();
      _selectedCount = 0;
    });
  }


  void _finalizeSelection() {
    setState(() {
      currentYear += 1; // Increment the year
    });
    GoRouter.of(context).go('/play'); // Assuming you need to adjust navigation logic as well
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    String selectedIdsText = _selectedInitiativeIds.isNotEmpty ? " (Selected IDs: ${_selectedInitiativeIds.join(', ')})" : "";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ValueListenableBuilder<int>(
              valueListenable: settings.currentYear,
              // Assuming nextLocation is a ValueListenable<bool>
              builder: (context, currentYear, child) {
                return ListTile(
                  title: Text(
                      'Make decisions for year $currentYear:',
                    style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0C2D57),
                  ),), // Conditional text based on boolean value
                );
              },
            ),
          ),
          ..._initiatives.map((initiative) => _buildInitiativeCard(initiative)).toList(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyButton(
              onPressed: _finalizeSelection,
              child: const Text('Make decisions'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitiativeCard(Initiative initiative) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(
            initiative.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C2D57),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                initiative.text,
                style: TextStyle(
                  color: Color(0xFF0C2D57),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Switch(
                    value: _selectedInitiativeIds.contains(initiative.id),
                    onChanged: (bool newValue) {
                      setState(() {
                        if (newValue) {
                          if (_selectedCount < 2) {
                            _selectedInitiativeIds.add(initiative.id);
                            _selectedCount++;
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Limit Reached'),
                                content: Text('You can only select up to 2 initiatives.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          _selectedInitiativeIds.remove(initiative.id);
                          _selectedCount--;
                        }
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Initiative {
  final String id;
  final String name;
  final String text;
  final String decisionRating;
  final String feedback;

  Initiative({
    required this.id,
    required this.name,
    required this.text,
    required this.decisionRating,
    required this.feedback,
  });

  factory Initiative.fromJson(Map<String, dynamic> json) {
    return Initiative(
      id: json['id']?.toString() ?? '',
      name: json['Name']?.toString() ?? '',
      text: json['Text']?.toString() ?? '',
      decisionRating: json['Decision Rating (1-3)']?.toString() ?? '0', // Handle potential int here
      feedback: json['Feedback']?.toString() ?? '',
    );
  }
}

