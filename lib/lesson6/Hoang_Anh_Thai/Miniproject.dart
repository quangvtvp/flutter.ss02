//code by NotTie
import 'dart:io';

void main() {
  Map<dynamic, double> diem = {};
  print('Nhập các môn muốn thêm: ');
  String? mon;
  do {
    mon = stdin.readLineSync()!;
    print('Nhập hẳn hoi');
  } while (mon.isEmpty);
  List<dynamic> monhoc = mon.split(" ");
  for (int i = 0; i < monhoc.length; i++) {
    double? a;
    do {
      print('Nhập điểm của môn ${monhoc[i]}: ');
      a = double.tryParse(stdin.readLineSync()!);
      if (a == null || a <= 0 || a >= 10) {
        print('Nhập hẳn hoi');
      }
    } while (a == null || a <= 0 || a >= 10);

    diem['${monhoc[i]}'] = a;
  }
  print('Bẳng điểm của bạn là: ');
  diem.forEach((key, value) {
    print('$key: $value');
  });
  print(
    'Điểm trung bình: ${diem.values.reduce((a, b) => a + b) / diem.length}',
  );
  stdout.write('Các môn có điểm giỏi là:');
  diem.forEach((key, value) {
    if (value >= 8) {
      stdout.write(' $key');
    }
  });
  while (true) {
    print('Nhập môn muốn xem điểm: ');
    String? xem = stdin.readLineSync();
    if (xem != null && diem.containsKey(xem)) {
      print('Điểm của môn $xem là: ${diem[xem]}');
      break;
    } else {
      print('Môn không tồn tại, nhập lại');
    }
  }
}
