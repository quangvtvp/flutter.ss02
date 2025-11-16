## Repository Layout
- `flutter/word_guess_game` is the active Flutter app; `lib/` contains the app shell, controllers, screens, and widgets.
- `dart/exercises` keeps console samples from lessons; run `dart test`/`dart run` there when fixing exercises.
- `scripts/deploy_word_guess_game.sh` wraps the Azure Static Web Apps deploy flow for the web build.

## Flutter Game Architecture
- Entry point `flutter/word_guess_game/lib/main.dart` bootstraps controllers, initializes Supabase, SharedPreferences, audio, and Games Services before rendering `WordGuessApp`.
- Dependency injection relies on `provider`; extend with `ChangeNotifier` and register through the `MultiProvider` in `main.dart`.
- `lib/app.dart` defines routes for the menu and game screens and switches between light/dark themes via `SettingsController.darkMode`.

## State & Game Flow
- `GameSessionController` (`lib/managers/game_session_controller.dart`) owns the 30s timer, word pool, scoring, and `awaitingScoreSubmission` flag; always call its public methods to mutate state so listeners update correctly.
- Words are uppercase Vietnamese phrases seeded in `_defaultWords`; `startNewGame(randomizeOrder: true)` reshuffles and resets `runId` so `GameScreen` can detect new runs.
- `ScoreRepository` talks to Supabase table `scores`, dedupes leaderboard rows per lowercase player name, and exposes loading/error state to the UI.
- `SettingsController` persists audio/vibration/theme/player name to SharedPreferences and mirrors the name into browser `localStorage` via `utils/browser_storage.dart` for PWA refreshes.

## UI Composition
- `MenuScreen` triggers `GameSessionController.startNewGame`, opens settings/leaderboard sheets, and plays tap audio through `AudioController`.
- `GameScreen` listens to `GameSessionController`, prompts for missing player names, auto-submits scores when `SettingsController.hasPlayerName` is true, and shows the leaderboard bottom sheet on success.
- `LeaderboardSheet` refreshes on first open and on pull-to-refresh, using `ScoreRepository.refreshLeaderboard()`.
- `LetterTile` in `lib/widgets/letter_tile.dart` encapsulates tile animation and selection visuals.

## Audio & External Services
- `AudioController` plays assets in `assets/audio/` with `audioplayers`; on failure it falls back to `SystemSoundType.click`, so keep short MP3s under that folder.
- `GamesServicesController` wraps the `games_services` plugin and no-ops when sign-in fails—guard any new achievements or leaderboard calls with `isAvailable`.
- Supabase is initialized with a production URL/key in `main.dart`; scores expect columns `player_name`, `score`, `created_at`.

## Development Workflow
- From `flutter/word_guess_game`, run `flutter pub get`, `flutter run -d chrome`, and `flutter analyze` during feature work.
- The generated `test/widget_test.dart` still references `MyApp`; update it before relying on `flutter test` for CI.
- Deploy via `scripts/deploy_word_guess_game.sh` (requires `az login`, `flutter build web`, and `swa deploy word-guess-game --env production ...`).

## Dart Exercises
- Console lessons live under `dart/exercises/lib`; adjust `pubspec.yaml` and the shared `analysis_options.yaml` there when adding new training code.
- Run `dart pub get` and `dart test` inside `dart/exercises/` to validate exercises without touching the Flutter app.

## Contribution Notes
- Keep controllers lightweight and testable; state flows through `ChangeNotifier` + Provider rather than global singletons.
- Follow Material 3 theming defined in `lib/app.dart`; custom fonts currently rely on system fallbacks, so add font assets before referencing new families.
- When adding new screens, register routes in `app.dart` and wire them into the menu instead of pushing anonymous routes.
