import 'package:dart_basic/lesson7/game.dart';
import 'package:test/test.dart';

void main() {
  group('revealCharacters', () {
    test('reveals matching letters for single character guesses', () {
      const word = 'FLUTTER';
      const current = '*******';
      final revealed = revealCharacters(word, current, 't');
      expect(revealed, equals('**TT***'));
    });

    test('reveals entire word on correct full guess', () {
      const word = 'DART';
      const current = '****';
      final revealed = revealCharacters(word, current, 'dart');
      expect(revealed, equals('DART'));
    });

    test('keeps current state if guess has no matching letters', () {
      const word = 'STATE';
      const current = '*****';
      final revealed = revealCharacters(word, current, 'z');
      expect(revealed, equals(current));
    });

    test('throws when word and state lengths differ', () {
      expect(
        () => revealCharacters('DART', '**', 'd'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
