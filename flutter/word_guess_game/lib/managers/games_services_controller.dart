import 'dart:developer';

import 'package:games_services/games_services.dart';

/// Lightweight wrapper around the games_services plugin to match toolkit guidance.
class GamesServicesController {
  bool _isAvailable = false;

  bool get isAvailable => _isAvailable;

  Future<void> initialize() async {
    try {
      await GamesServices.signIn();
      _isAvailable = true;
    } catch (error) {
      log('GamesServices unavailable: $error');
      _isAvailable = false;
    }
  }

  Future<void> reportWin() async {
    if (!_isAvailable) return;
    try {
      await GamesServices.unlock(
        achievement: Achievement(
          androidID: 'word_guess_win',
          iOSID: 'word_guess_win',
        ),
      );
    } catch (error) {
      log('Unable to unlock achievement: $error');
    }
  }

  Future<void> reportScore(int attempts) async {
    if (!_isAvailable) return;
    try {
      await GamesServices.submitScore(
        score: Score(
          androidLeaderboardID: 'word_guess_leaderboard',
          iOSLeaderboardID: 'word_guess_leaderboard',
          value: attempts,
        ),
      );
    } catch (error) {
      log('Unable to submit score: $error');
    }
  }
}
