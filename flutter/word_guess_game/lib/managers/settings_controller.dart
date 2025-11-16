import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/browser_storage.dart';

/// Manages persisted player preferences such as audio and haptics.
class SettingsController extends ChangeNotifier {
  SettingsController(this._prefs);

  final SharedPreferences _prefs;

  static const _audioEnabledKey = 'audioEnabled';
  static const _vibrationEnabledKey = 'vibrationEnabled';
  static const _darkModeKey = 'darkMode';
  static const _playerNameKey = 'playerName';

  bool _audioEnabled = true;
  bool _vibrationEnabled = true;
  bool _darkMode = false;
  String? _playerName;

  bool get audioEnabled => _audioEnabled;
  bool get vibrationEnabled => _vibrationEnabled;
  bool get darkMode => _darkMode;
  String? get playerName => _playerName;
  bool get hasPlayerName => (_playerName != null && _playerName!.isNotEmpty);

  Future<void> loadState() async {
    _audioEnabled = _prefs.getBool(_audioEnabledKey) ?? true;
    _vibrationEnabled = _prefs.getBool(_vibrationEnabledKey) ?? true;
    _darkMode = _prefs.getBool(_darkModeKey) ?? false;
    _playerName = _prefs.getString(_playerNameKey);

    if (_playerName == null || _playerName!.isEmpty) {
      // Ensure web builds restore the cached name even if SharedPreferences misses.
      final cachedName = await readBrowserString(_playerNameKey);
      if (cachedName != null && cachedName.trim().isNotEmpty) {
        _playerName = cachedName.trim();
        await _prefs.setString(_playerNameKey, _playerName!);
      }
    }

    await writeBrowserString(_playerNameKey, _playerName);
    notifyListeners();
  }

  Future<void> toggleAudio() async {
    _audioEnabled = !_audioEnabled;
    await _prefs.setBool(_audioEnabledKey, _audioEnabled);
    notifyListeners();
  }

  Future<void> toggleVibration() async {
    _vibrationEnabled = !_vibrationEnabled;
    await _prefs.setBool(_vibrationEnabledKey, _vibrationEnabled);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _darkMode = !_darkMode;
    await _prefs.setBool(_darkModeKey, _darkMode);
    notifyListeners();
  }

  Future<void> setPlayerName(String name) async {
    final trimmed = name.trim();
    _playerName = trimmed.isEmpty ? null : trimmed;

    if (_playerName == null) {
      await _prefs.remove(_playerNameKey);
    } else {
      await _prefs.setString(_playerNameKey, _playerName!);
    }

    await writeBrowserString(_playerNameKey, _playerName);
    notifyListeners();
  }
}
