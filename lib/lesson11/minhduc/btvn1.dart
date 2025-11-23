import'dart:async';
Future<String> thucday() {
  return Future.delayed(Duration(seconds: 1), () => 'Thức dậy lúc 6:00 AM');
}
Future<String> ruaMatDanhRang() {
  return Future.delayed(Duration(seconds: 2), () => 'Rửa mặt và đánh răng xong');
}
Future<String> anSang() {
  return Future.delayed(Duration(seconds: 2), () => 'Ăn sáng xong');
}
void main() async {
  print('Bắt đầu chu trình buổi sáng...');
  String ketQua1 = await thucday();
  print(ketQua1);
  String ketQua2 = await ruaMatDanhRang();
  print(ketQua2);
  String ketQua3 = await anSang();
  print(ketQua3);
  print('Sẵn sàng đi học...');
  print('Chu trình buổi sáng kết thúc.');
}