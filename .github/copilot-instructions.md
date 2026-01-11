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

```instructions
## Purpose
Short, actionable guidance for AI coding agents working in this repo — where to look, how state flows, build/test commands, and important conventions.

## Big picture
- Two main areas: `flutter/` (multiple Flutter samples; primary app is `flutter/word_guess_game`) and `dart/exercises` (console lessons).
- Primary app entry: `flutter/word_guess_game/lib/main.dart` — initializes Supabase, SharedPreferences, audio, and registers controllers in a `MultiProvider`.

## Key components & boundaries
- UI & routes: `flutter/word_guess_game/lib/app.dart` (theme, named routes).
- Game logic: `flutter/word_guess_game/lib/managers/game_session_controller.dart` — owns timer, word pool, scoring, and `awaitingScoreSubmission`. Use its public methods to change state.
- Persistence & backend: `flutter/word_guess_game/lib/repositories/score_repository.dart` (Supabase `scores` table), `SettingsController` (SharedPreferences + `utils/browser_storage.dart`).
- Media & platform: audio assets under `flutter/word_guess_game/assets/audio/`; `AudioController` uses `audioplayers` with a system-sound fallback. `GamesServicesController` wraps `games_services` and must be guarded by `isAvailable`.

## Project-specific conventions
- State + DI: prefer `ChangeNotifier` subclasses + `provider` for DI. Register providers in `main.dart` and mutate controllers via public methods so listeners update correctly.
- No global singletons for mutable state; keep controllers lightweight and testable.
- Route additions: always register new screens in `app.dart` instead of pushing anonymous routes.

## Common operations & commands
- Dev run (Flutter app):
	- cd flutter/word_guess_game
	- `flutter pub get`
	- `flutter run -d chrome`
	- `flutter analyze`
- Tests:
	- Flutter tests: `flutter test` from `flutter/word_guess_game` (note: `test/widget_test.dart` references `MyApp` and may need updating).
	- Dart exercises: `cd dart/exercises && dart pub get && dart test`
- Build & deploy (web): run `scripts/deploy_word_guess_game.sh` (requires `az login`, `flutter build web`, and `swa deploy ...`).

## Integration & secrets
- Supabase: production URL/key are initialized in `main.dart` — do not commit secrets; prefer CI secrets/environment variables.
- Leaderboard storage expects columns `player_name`, `score`, `created_at` in Supabase.
- Browser behavior: `SettingsController` mirrors player name into `utils/browser_storage.dart` to survive PWA refresh.

## Useful file hits (where to start for common tasks)
- Add a new screen: `flutter/word_guess_game/lib/app.dart`, register route and update menu in `MenuScreen`.
- Change game rules/timer: `flutter/word_guess_game/lib/managers/game_session_controller.dart`.
- Score persistence or leaderboard bug: `flutter/word_guess_game/lib/repositories/score_repository.dart`.
- Player settings and persistence: `flutter/word_guess_game/lib/controllers/settings_controller.dart` and `utils/browser_storage.dart`.
- UI/animations: `flutter/word_guess_game/lib/widgets/letter_tile.dart`.
- Deploy script: `scripts/deploy_word_guess_game.sh`.

## Short examples
- Start a new game: `GameSessionController.startNewGame(randomizeOrder: true)`
- Refresh leaderboard: `ScoreRepository.refreshLeaderboard()`

## Testing & CI notes
- Before relying on `flutter test` in CI, update `test/widget_test.dart` (it still references `MyApp`).
- Run `flutter analyze` and `dart format` on files you change.

## When uncertain
- Inspect `flutter/word_guess_game/lib/main.dart` to see which controllers are provided and how platform services are initialized.

---
If anything here is unclear or you want the doc to include more examples (code snippets or exact provider lists from `main.dart`), tell me which section to expand.
```
