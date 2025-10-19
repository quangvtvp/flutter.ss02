void main() {
  String list1 = "chơi game, xem phim";
  String list2 = "chơi game, xem phim";
  String list3 = "ngủ, ăn";
  Map<String, String> map1 = {"Thái": list1, "Minh": list2, "Đúc": list3};
  for (var entry in map1.entries) {
    print('Sở thích của ${entry.key} là: ${entry.value}');
  }
}
