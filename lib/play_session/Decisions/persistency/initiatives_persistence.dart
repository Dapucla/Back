// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An interface of persistence stores for settings.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud-based solutions.
abstract class InitiativesPersistence {
  Future<String> getInitiativeID();

  Future<String> getInitiativeName();

  Future<String> getInitiativeText();

  Future<String> getInitiativeDecisionRating();

  Future<String> getInitiativeFeedback();


  Future<void> saveInitiativeID(String value);

  Future<void> saveInitiativeName(String value);

  Future<void> saveInitiativeText(String value);

  Future<void> saveInitiativeDecisionRating(String value);

  Future<void> saveInitiativeFeedback(String value);

}
