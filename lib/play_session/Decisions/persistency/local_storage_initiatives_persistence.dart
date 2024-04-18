import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'initiatives.dart'; // Adjust the import path based on your project structure

class LocalStorageInitiativesPersistence {
  // Key for storing initiatives data
  static const String _storageKey = 'initiatives';

  // Load initiatives from shared preferences
  Future<List<Initiative>> loadInitiatives() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? initiativesJson = prefs.getString(_storageKey);
    if (initiativesJson != null) {
      List<dynamic> decodedJson = jsonDecode(initiativesJson) as List<dynamic>;
      return decodedJson.map((json) => Initiative.fromJson(json as Map<String, dynamic>)).toList();
    }
    return [];
  }

  // Save initiatives to shared preferences
  Future<bool> saveInitiatives(List<Initiative> initiatives) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String initiativesJson = jsonEncode(initiatives.map((i) => i.toJson()).toList());
    return prefs.setString(_storageKey, initiativesJson);
  }
}
