import 'dart:io';

void main() {
  Map<String, double> bangdiem = {};
  print('Nhap so mon hoc: ');
  int somon = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < somon; i++) {
    print('Nhap ten mon hoc thu ${i + 1}: ');
    String tenmon = stdin.readLineSync()!;
    print('Nhap diem mon hoc thu ${i + 1}:');
    double diemmon = double.parse(stdin.readLineSync()!);
    bangdiem[tenmon] = diemmon;
    print(' BANG DIEM ');
    bangdiem.forEach((tenmon, diemmon) {
      print('$tenmon: $diemmon');
    });
  }
  double tongdiem = 0;
  for (var diemmon in bangdiem.values) {
    tongdiem += diemmon;

    double avg = tongdiem / bangdiem.length;
    print(' Diem trung binh: ${avg.toStringAsFixed(2)}');
    List<String> mongioi = [];
    bangdiem.forEach((tenmon, diemmon) {
      if (diemmon > 8) {
        mongioi.add(tenmon);
      }
    });
    print(mongioi);
    print('Mon can tim: ');
    String timmon = stdin.readLineSync()!;
    if (bangdiem.containsKey(timmon)) {
      print(' Diem mon $timmon la: $diemmon ');
    } else {
      print('Khong tim thay mon hoc nay');
    }
  }
}
