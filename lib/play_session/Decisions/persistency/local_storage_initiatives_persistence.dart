// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

import 'initiatives_persistence.dart';

class LocalStorageInitiativesPersistence extends InitiativesPersistence {

  final Future<SharedPreferences> instanceFuture = SharedPreferences.getInstance();

  @override
  Future<String> getInitiativeDecisionRating() async {
    final prefs = await instanceFuture;
    return prefs.getString('decisionRating') ?? '';
  }

  @override
  Future<String> getInitiativeFeedback() async {
    final prefs = await instanceFuture;
    return prefs.getString('feedback') ?? '';
  }

  @override
  Future<String> getInitiativeID() async {
    final prefs = await instanceFuture;
    return prefs.getString('initiativeID') ?? '';
  }

  @override
  Future<String> getInitiativeName() async {
    final prefs = await instanceFuture;
    return prefs.getString('initiativeName') ?? '';
  }

  @override
  Future<String> getInitiativeText() async{
    final prefs = await instanceFuture;
    return prefs.getString('initiativeText') ?? '';
  }

  @override
  Future<void> saveInitiativeDecisionRating(String value) async {
    final prefs = await instanceFuture;
    await prefs.setString('decisionsRating', value);
  }

  @override
  Future<void> saveInitiativeFeedback(String value) async {
    final prefs = await instanceFuture;
    await prefs.setString('feedback', value);
  }

  @override
  Future<void> saveInitiativeID(String value) async{
    final prefs = await instanceFuture;
    await prefs.setString('initiativeID', value);
  }

  @override
  Future<void> saveInitiativeName(String value) async {
    final prefs = await instanceFuture;
    await prefs.setString('initiativeName', value);
  }

  @override
  Future<void> saveInitiativeText(String value) async {
    final prefs = await instanceFuture;
    await prefs.setString('initiativeText', value);
  }
}
