// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'initiatives_persistence.dart';

/// An in-memory implementation of [InitiativesPersistence].
/// Useful for testing.
class MemoryOnlyInitiativesPersistence implements InitiativesPersistence {

  String decisionRating = '';

  String feedback = '';

  String initiativeID = '';

  String initiativeName = '';

  String initiativeText = '';


  @override
  Future<String> getInitiativeDecisionRating() async => decisionRating;

  @override
  Future<String> getInitiativeFeedback() async => feedback;

  @override
  Future<String> getInitiativeID() async => initiativeID;

  @override
  Future<String> getInitiativeName() async => initiativeName;

  @override
  Future<String> getInitiativeText() async => initiativeText;


  @override
  Future<void> saveInitiativeDecisionRating(String value) async => decisionRating = value;

  @override
  Future<void> saveInitiativeFeedback(String value) async => feedback = value;

  @override
  Future<void> saveInitiativeID(String value) async => initiativeID = value;

  @override
  Future<void> saveInitiativeName(String value) async => initiativeName = value;

  @override
  Future<void> saveInitiativeText(String value) async => initiativeName = value;

}
