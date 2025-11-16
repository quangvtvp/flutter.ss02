import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'settings_controller.dart';

/// Handles lightweight sound effects used across the game.
class AudioController {
  AudioController(this._settingsController);

  final SettingsController _settingsController;
  final AudioPlayer _player = AudioPlayer();
  bool _assetsAvailable = true;

  Future<void> initialize() async {
    await _player.setReleaseMode(ReleaseMode.stop);
  }

  Future<void> playCorrect() async {
    if (!_settingsController.audioEnabled) return;
    await _playAsset('audio/win.mp3');
  }

  Future<void> playIncorrect() async {
    if (!_settingsController.audioEnabled) return;
    await _playAsset('audio/lose.mp3');
  }

  Future<void> playTap() async {
    if (!_settingsController.audioEnabled) return;
    await _playAsset('audio/tap.mp3');
  }

  Future<void> _playAsset(String asset) async {
    if (!_assetsAvailable) {
      await SystemSound.play(SystemSoundType.click);
      return;
    }

    try {
      await _player.stop();
      await _player.play(AssetSource(asset));
    } catch (_) {
      _assetsAvailable = false;
      await SystemSound.play(SystemSoundType.click);
    }
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
