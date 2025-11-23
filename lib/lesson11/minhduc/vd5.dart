import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  final List<String> colors = ['red', 'blue', 'green', 'yellow', 'orange'];
  final lineStream =
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  print('Welcome to the Color Guessing Game!');

  while (true) {
    final playAgain = await playRound(colors, lineStream);
    if (!playAgain) {
      print('Goodbye!');
    }
  }
}

Future<bool> playRound(List<String> colors, Stream<String> lineStream) async {
  final selectedColor = (List.of(colors)..shuffle()).first;
  const totalSeconds = 10;
  int remaining = totalSeconds;

  print(
      '\nYou have $totalSeconds seconds to guess the color. Available colors: ${colors.join(', ')}');

  final completer = Completer<String>();

  // Hiển thị đếm ngược mỗi giây
  final countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    remaining--;
    if (remaining > 0) {
      print('Time left: $remaining s');
    } else {
      // Hết giờ
      if (!completer.isCompleted) completer.complete('timeout');
      timer.cancel();
    }
  });

  // Lắng nghe input cho vòng chơi này
  final subscription = lineStream.listen((line) {
    final guess = line.trim().toLowerCase();
    if (guess.isEmpty) {
      stdout.write('Please enter a color: ');
      return;
    }
    if (!colors.contains(guess)) {
      stdout.write(
          'Invalid color. Available: ${colors.join(', ')} \nTry again: ');
      return;
    }
    if (guess == selectedColor) {
      if (!completer.isCompleted) completer.complete('guessed');
    } else {
      stdout.write('Wrong guess. Try again: ');
    }
  }, onError: (e) {
    if (!completer.isCompleted) completer.completeError(e);
  });

  stdout.write('Guess the color: ');

  try {
    final result = await completer.future;
    if (result == 'guessed') {
      print('\nCongratulations! You guessed it right.');
    } else {
      print('\nTime is up! You lost. The correct color was: $selectedColor');
    }
  } catch (e) {
    print('\nAn error occurred: $e');
  } finally {
    countdownTimer.cancel();
    await subscription.cancel();
  }

  // Hỏi chơi lại (dùng blocking readLineSync an toàn tại đây vì vòng chơi đã kết thúc)
  stdout.write('\nPlay again? (y/n): ');
  final answer = stdin.readLineSync();
  if (answer == null) return false;
  final yn = answer.trim().toLowerCase();
  return yn.isNotEmpty && yn[0] == 'y';
}
