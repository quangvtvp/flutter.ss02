import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'managers/audio_controller.dart';
import 'managers/game_session_controller.dart';
import 'managers/games_services_controller.dart';
import 'managers/score_repository.dart';
import 'managers/settings_controller.dart';
import 'managers/word_prompt_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (error) {
    debugPrint('Unable to load .env file: $error');
  }

  final sharedPreferences = await SharedPreferences.getInstance();
  final settingsController = SettingsController(sharedPreferences);
  await settingsController.loadState();

  final audioController = AudioController(settingsController);
  await audioController.initialize();

  final gamesServicesController = GamesServicesController();
  await gamesServicesController.initialize();

  final wordPromptService = WordPromptService(
    apiKey: dotenv.env['GEMINI_API_KEY'],
  );

  await Supabase.initialize(
    url: 'https://ppxbcstgxdmixgedhwnc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBweGJjc3RneGRtaXhnZWRod25jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyMTQ5NzgsImV4cCI6MjA3ODc5MDk3OH0.SfFXlIa8pSGU8iJR_HNFwCN0gU7tGV29txCfjF1J130',
  );

  final supabaseClient = Supabase.instance.client;
  final scoreRepository = ScoreRepository(supabaseClient);
  await scoreRepository.refreshLeaderboard();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsController>.value(
          value: settingsController,
        ),
        Provider<AudioController>.value(value: audioController),
        Provider<GamesServicesController>.value(value: gamesServicesController),
        Provider<WordPromptService>.value(value: wordPromptService),
        ChangeNotifierProvider<ScoreRepository>.value(value: scoreRepository),
        ChangeNotifierProvider<GameSessionController>(
          create: (_) => GameSessionController(
            audioController: audioController,
            gamesServicesController: gamesServicesController,
            scoreRepository: scoreRepository,
            wordPromptService: wordPromptService,
          ),
        ),
      ],
      child: const WordGuessApp(),
    ),
  );
}
