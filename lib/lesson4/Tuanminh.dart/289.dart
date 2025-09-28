void main() {
  List<int> diemso = [9, 8, 5, 4, 3, 2];
  var list = [];
  for (var b in diemso) {
    if (b >= 5) {
      list.add(b);
    }
  }
  print(list);

  List<int> list2 = diemso.where((d) => d >= 5).toList(); // chuyển thành list
  print(list2);
  List<int> list3 = diemso.where((d) => (d % 5) == 0).toList();
  print('điểm trên trung bình: ${list3}');

  if (diemso.contains(5)) {
    print("có 5");
  }
}
