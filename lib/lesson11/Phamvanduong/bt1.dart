import 'dart:async';

Future<String> thucday() {
  return Future.delayed(Duration(seconds: 1), () => 'Thức dậy lúc 6:00');
}

Future<String> ruamatdanhrang() {
  return Future.delayed(
      Duration(seconds: 2), () => 'Rửa mặt và đánh răng xong');
}

Future<String> anSang() {
  return Future.delayed(Duration(seconds: 2), () => 'Ăn sáng xong');
}

void main() async {
  print(' Bắt đầu ngày mới');
  String result1 = await thucday();
  print(result1);
  String result2 = await ruamatdanhrang();
  print(result2);
  String result3 = await anSang();
  print(result3);
  print('Sẵn sàng đi học');
}
