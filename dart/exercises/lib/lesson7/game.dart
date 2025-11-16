import 'dart:io';
import 'dart:math';

/// Reveals characters from [word] in [currentState] that match any character in [guess].
///
/// [word] should be the canonical form of the target word (typically uppercase),
/// and [currentState] should contain the same number of characters, mixing
/// revealed letters and masking tokens (e.g. `*`). The [guess] can be either a
/// single character or the full word. Matching characters are exposed in the
/// returned string. If the guess equals the word, the answer is fully revealed.
String revealCharacters(String word, String currentState, String guess) {
  final normalizedGuess = guess.trim().toUpperCase();
  if (normalizedGuess.isEmpty) {
    return currentState;
  }

  final wordChars = word.split('');
  final currentChars = currentState.split('');

  if (normalizedGuess == word) {
    return word;
  }

  for (var i = 0; i < wordChars.length; i++) {
    if (normalizedGuess.contains(wordChars[i])) {
      currentChars[i] = wordChars[i];
    }
  }

  return currentChars.join();
}

void main(List<String> args) {
  final puzzles = <({String word, String hint})>[
    (word: 'FLUTTER', hint: 'A popular UI toolkit by Google'),
    (word: 'DART', hint: 'Programming language used for Flutter'),
    (word: 'WIDGET', hint: 'Building block of Flutter UIs'),
    (word: 'STATE', hint: 'Data that can change over time in an app'),
    (word: 'ASYNC', hint: 'Keyword used for asynchronous functions'),
  ];

  final random = Random();
  final puzzle = puzzles[random.nextInt(puzzles.length)];
  final secretWord = puzzle.word.toUpperCase();
  var revealedWord = List.filled(secretWord.length, '*').join();
  final guessedLetters = <String>{};
  var attempts = 0;

  stdout.writeln(
    'Guess the word! You\'ll get a hint and uncover letters as you go.',
  );
  stdout.writeln('Hint: ${puzzle.hint}');
  stdout.writeln('The word has ${secretWord.length} letters.');

  while (revealedWord.contains('*')) {
    stdout.writeln('\nCurrent word: $revealedWord');
    stdout.write('Enter a letter or guess the full word: ');
    final input = stdin.readLineSync();
    final guess = input?.trim();

    if (guess == null || guess.isEmpty) {
      stdout.writeln('Please enter at least one character.');
      continue;
    }

    attempts++;
    final normalized = guess.toUpperCase();

    if (normalized.length == 1) {
      final letter = normalized;

      if (!guessedLetters.add(letter)) {
        stdout.writeln('You already tried "$letter".');
        continue;
      }

      final newState = revealCharacters(secretWord, revealedWord, letter);
      if (newState == revealedWord) {
        stdout.writeln('No "$letter" in the word.');
      } else {
        stdout.writeln('Nice! "$letter" revealed new letters.');
        revealedWord = newState;
      }
    } else {
      if (normalized == secretWord) {
        revealedWord = secretWord;
        break;
      }

      stdout.writeln('That guess isn\'t quite right. Keep trying!');
    }
  }

  stdout.writeln('\nCongratulations! The word was "$secretWord".');
  stdout.writeln('Attempts taken: $attempts');
}
