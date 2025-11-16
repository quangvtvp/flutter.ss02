import 'dart:io';

void main() {
  var qAndA = <String, String>{
    // thêm vào danh sách câu hỏi và đáp án bằng tiếng việt
    // ví dụ quốc gia nào có diện tích lớn nhất thế giới
    'quốc gia nào có diện tích lớn nhất thế giới': 'nga',
    'quốc gia nào có dân số đông nhất thế giới': 'trungquoc',
    'đại dương nào lớn nhất trên trái đất': 'thaibinhduong',
    'hành tinh nào gần mặt trời nhất': 'saothuy',
    'ai là người phát minh ra bóng đèn': 'thomasedison',
    'ai là tác giả của thuyết tương đối': 'alberteinstein',
  };
  qAndA.forEach((question, answer) {
    print(question);
    playUnvealGame(answer);
  });
}

void play(String word) {
  var listCharacter = word.split('');
  listCharacter.shuffle();
  var shuffledWord = listCharacter.join();
  print(shuffledWord);
  var answer = '';
  do {
    stdout.write('Nhap vao tu ban doan: ');
    answer = stdin.readLineSync() ?? '';
    if (answer.toLowerCase() == word.toLowerCase()) {
      print('Ban da doan dung');
    } else {
      print('Ban da doan sai');
    }
  } while (answer.toLowerCase() != word.toLowerCase());
}

bool kiemTraNamNhuan(int? year) {
  if (year == null || year <= 0) {
    throw Exception('Nam nhuan khong hop le');
  }
  if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
    return true;
  } else {
    return false;
  }
}

// 1. convert word to * character
// 2. input character from user
// 3. check character is in word
// 4. if yes, replace * with character
// 5. if no, continue input character
// 6. if all character is revealed, user win
// 7. if user input full word and correct, user win
void playUnvealGame(String word) {
  var revealedWord = List.filled(word.length, '*').join();
  do {
    stdout.writeln('Current word: $revealedWord');
    stdout.write('Enter a letter or guess the full word: ');
    final input = stdin.readLineSync();
    final guess = input?.trim();

    if (guess == null || guess.isEmpty) {
      stdout.writeln('Please enter at least one character.');
      continue;
    }
    if (guess.length == 1) {
      var orgList = word.toUpperCase().split('');
      var currentList = revealedWord.split('');

      for (var i = 0; i < orgList.length; i++) {
        if (orgList[i] == guess.toUpperCase()) {
          currentList[i] = orgList[i];
        }
      }
      revealedWord = currentList.join();
    } else if (guess.toUpperCase() == word.toUpperCase()) {
      revealedWord = word;
    } else {
      stdout.writeln('Incorrect guess. Try again.');
    }
  } while (revealedWord.contains('*'));

  stdout.writeln('Congratulations! You guessed the word: $word');
}

String revealCharacters(String word, String currentState, String guess) {
  final normalizedGuess = guess.trim().toUpperCase();
  final wordChars = word.toUpperCase().split('');
  final currentChars = currentState.split('');

  if (normalizedGuess == word.toUpperCase()) {
    return word;
  }

  for (var i = 0; i < wordChars.length; i++) {
    if (normalizedGuess.contains(wordChars[i])) {
      currentChars[i] = wordChars[i];
    }
  }

  return currentChars.join();
}
