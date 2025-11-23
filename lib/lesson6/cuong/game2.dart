
void main() {
  List<String> words = [
    "ha noi",
    "hai phong",
    "da nang",
    "ho chi minh",
    "can tho"
  ];
  List<String> hoi = [
    "thủ đô của việt nam",
    "thành phố hoa phượng đỏ",
    "thành phố đáng sống",
    "thành phố mang tên bác",
    "thành phố miền tây"
  ];
  for (var i = 0; i < words.length; i++) {
    for (var j = 0; j < hoi.length; j++) {
      if (i == j) {
        play(words[i], hoi[j]);
      }
    }
  }
}

void play(String input, String question) {
  List<String> random = input.split();
  List<String> chars = random..shuffle();
  String result = "";
  for (var i = 0; i < chars.length; i++) {
    if (chars[i] == input[0]) {
      result += input[0];
    } else {
      result += "*";
    }
  }
}
