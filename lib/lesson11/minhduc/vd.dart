import 'dart:async';
import 'dart:convert';
import 'dart:io';
// Game đoán màu với đồng hồ đếm ngược.
// Nếu hết giờ mà chưa đoán đúng -> thua game.
Future<void> main(List<String> args) async {
  List<String> colors = ['red', 'blue', 'green', 'yellow', 'orange'];
  final selectedColor = (colors..shuffle()).first;

  print(
      'You have 10 seconds to guess the color. Available colors: ${colors.join(', ')}');
  final lineStream =
      stdin.transform(utf8.decoder).transform(const LineSplitter());
  final completer = Completer<String>();
  late StreamSubscription<String> subscription;
  subscription = lineStream.listen((line) {
    final guess = line.trim().toLowerCase();
    if (guess.isEmpty) {
      stdout.write('Please enter a color: ');
      return;
    }
    if (guess == selectedColor) {
      if (!completer.isCompleted) {
        completer.complete('guessed');
      }
    } else {
      stdout.write('Wrong guess. Try again: ');
    }
  }, onError: (e) {
    if (!completer.isCompleted) completer.completeError(e);
  });

  stdout.write('Guess the color: ');

  final timerFuture =
      Future.delayed(const Duration(seconds: 10), () => 'timeout');

  final guessFuture = completer.future;

  try {
    final result = await Future.any([timerFuture, guessFuture]);
    if (result == 'guessed') {
      print('\nCongratulations! You guessed it right.');
    } else {
      print('\nTime is up! You lost. The correct color was: $selectedColor');
    }
  } catch (e) {
    print('\nAn error occurred: $e');
  } finally {
    await subscription.cancel();
  }
}