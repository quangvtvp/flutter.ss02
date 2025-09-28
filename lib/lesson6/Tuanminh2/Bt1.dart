void main() {
  var monan = ["Gà", "Mì trộn", "Bánh ngọt"];
  print('first monan: ${monan.first}');
  monan.addAll(["Cơm", "Cake"]);
  monan.insert(1, "Grape");
  monan.remove("Gà");
  monan.removeAt(3);
  monan[0] = "Thịt bò";
  for (int i = 0; i < monan.length; i++) {
    print('Món ăn thứ ${i + 1}: ${monan[i]}');
  }
  for (var b in monan) {
    print("Món ăn: $b");
  }
  monan.forEach((a) {
    print("Món ăn: $a");
  });
}
