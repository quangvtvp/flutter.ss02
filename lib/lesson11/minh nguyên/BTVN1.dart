import 'dart:async';

Future<String> thucday() {
  return Future.delayed(Duration(seconds: 1), () {
    return "Thức dậy 6:00";
  });
}

Future<String> ranMatDanhRang() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Rửa mặt đánh răng xong";
  });
}

Future<String> anSang() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Ăn sáng xong";
  });
}

void main() async {
  String buoc1 = await thucday();
  print(buoc1);
  String buoc2 = await ranMatDanhRang();
  print(buoc2);
  String buoc3 = await anSang();
  print(buoc3);
  print('Sẵn sàng đi học');
}
