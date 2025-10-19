void main() {
  List<String> hobby1 = ['choi game', 'xem phim', 'nghe nhac'];
  List<String> hobby2 = ['choi game', 'di choi', 'du lich'];
  List<String> hobby3 = ['doc truyen', 'nghe nhac', 'chup anh'];
  Map<String, List<String>> hobby = {
    'Hoang anh thai': hobby1,
    'Quang': hobby2,
    'Minh': hobby3
  };
  for (String key in hobby.keys) {
    print('so thich cua $key la:${hobby[key]}');
  }
}
