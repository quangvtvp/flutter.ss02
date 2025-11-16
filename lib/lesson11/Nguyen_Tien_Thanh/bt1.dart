// Bài tập 1: Mô phỏng thói quen buổi sáng
// Hàm thức dậy
Future<String> thucDay() async {
  await Future.delayed(Duration(seconds: 1));
  return "Thức dậy lúc 6:00";
}

// Hàm rửa mặt đánh răng
Future<String> ruaMatDanhRang() async {
  await Future.delayed(Duration(seconds: 2));
  return "Rửa mặt và đánh răng xong";
}

// Hàm ăn sáng
Future<String> anSang() async {
  await Future.delayed(Duration(seconds: 2));
  return "Ăn sáng xong";
}

void main() async {
  String buoc1 = await thucDay();
  print(buoc1);

  String buoc2 = await ruaMatDanhRang();
  print(buoc2);

  String buoc3 = await anSang();
  print(buoc3);

  print("Sẵn sàng đi học!");
}