# Flutter Season 2 Coursework

This monorepo keeps the original Dart classroom exercises alongside the Flutter game projects that now serve as the primary focus. These instructions live in the repository root so that anyone landing on the GitHub page can understand how to get started and how we deploy the game to production.

## Repository Layout
- `dart/exercises/` – original Dart exercises and samples that accompanied the earlier lessons.
- `flutter/word_guess_game/` – the first Flutter game project; future games can live alongside this directory.

## Prerequisites
- Flutter SDK (3.24 or newer) with web support enabled.
- Dart SDK (bundled with Flutter) for the console exercises.
- Azure CLI and the Azure Static Web Apps CLI (`npm install -g @azure/static-web-apps-cli`) for deployments.

## Local Development
### Dart exercises
1. `cd dart/exercises`
2. `dart pub get`
3. `dart run` or `dart test`

### Flutter game
1. `cd flutter/word_guess_game`
2. `flutter pub get`
3. `flutter run -d chrome` (or choose your preferred device)

## Deployment
Run the following from `flutter/word_guess_game` after authenticating with `az login`:

```bash
flutter build web
swa deploy word-guess-game --env production --app-name flutter-fun-game-az \
	--resource-group rg-flutter-fun-game-az --subscription-id dd309c65-ffb6-4744-a7d7-a54deb059d47
```

Feel free to keep a personal wrapper script locally if that speeds up your workflow; the repo ignores `scripts/deploy_word_guess_game.sh` so it can remain untracked.

## Branches
- `main` – stable history.
- `flutter` – integration branch for active Flutter development and deployment.

> Tip: feel free to add more projects under either `dart/` or `flutter/` as the course expands.
