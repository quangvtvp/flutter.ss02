import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/audio_controller.dart';
import '../../managers/game_session_controller.dart';
import '../../managers/settings_controller.dart';
import '../leaderboard/leaderboard_screen.dart';
import '../settings/settings_sheet.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4F46E5), Color(0xFF9333EA)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () => _openSettings(context),
                    ),
                    IconButton(
                      icon: Icon(
                        settings.darkMode ? Icons.wb_sunny : Icons.dark_mode,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () => settings.toggleTheme(),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'WORD GUESS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Sắp xếp nhanh các chữ cái tiếng Việt trong 30 giây cho mỗi từ.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _startGame(context),
                  child: const Text(
                    'BẮT ĐẦU CHƠI',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    side: const BorderSide(color: Colors.white70, width: 2),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => _openLeaderboard(context),
                  child: const Text('XEM BẢNG XẾP HẠNG'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openSettings(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => const SettingsSheet(),
    );
  }

  Future<void> _startGame(BuildContext context) async {
    final gameSession = context.read<GameSessionController>();
    final audio = context.read<AudioController>();
    gameSession.startNewGame(randomizeOrder: true);
    await audio.playTap();
    if (context.mounted) {
      Navigator.of(context).pushNamed('/game');
    }
  }

  Future<void> _openLeaderboard(BuildContext context) async {
    final audio = context.read<AudioController>();
    await audio.playTap();
    if (!context.mounted) {
      return;
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LeaderboardSheet(),
    );
  }
}
