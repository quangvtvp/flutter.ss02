import 'dart:async';

Future<String> thucDay() {
  return Future.delayed(Duration(seconds: 3), () => 'thức dâyj');
}

Future<String> danhrang() {
  return Future.delayed(Duration(seconds: 3), () => 'rửa mặt và đánh răng');
}

Future<String> anSang() {
  return Future.delayed(Duration(seconds: 3), () => 'ăn sáng');
}

void main() async {
  print('Bắt đầu chu trình buổi sáng...');
  
  String buoc1 = await thucDay();
  print(buoc1);
  
  String buoc2 = await danhrang();
  print(buoc2);
  
  String buoc3 = await anSang();
  print(buoc3);
  
  print('kết thuc chu trình buổi sáng');
}