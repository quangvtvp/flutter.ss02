import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'managers/settings_controller.dart';
import 'screens/game/game_screen.dart';
import 'screens/menu/menu_screen.dart';

class WordGuessApp extends StatelessWidget {
  const WordGuessApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'Poppins'),
        bodyMedium: TextStyle(fontFamily: 'Poppins'),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: settings.darkMode
          ? ThemeData.dark().copyWith(textTheme: baseTheme.textTheme)
          : baseTheme,
      routes: {
        '/': (_) => const MenuScreen(),
        '/game': (_) => const GameScreen(),
      },
    );
  }
}
