void main() {
  List<String> hobby1 = ['Chơi game', 'Nghe nhạc', 'Xem phim'];
  List<String> hobby2 = ['Du lịch', 'Chụp ảnh', 'Nấu ăn'];
  Map<String, List<String>> hobbies = {
    'Nguyễn Minh Nguyên': hobby1,
    'Lê Uyên Nhi': hobby2,
  };
  for (String key in hobbies.keys) {
    print('Sở thích của $key là:${hobbies[key]}');
  }
}
