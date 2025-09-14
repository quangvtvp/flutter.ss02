import 'dart:io';

void main() {
  print(' Diem Toan: ');
  double? Toan = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print(' Diem Van: ');
  double? Van = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  print(' Diem Anh: ');
  double? Anh = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print(' Diem Lichsu: ');
  double? Lichsu = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print(' Diem Chuyencan: ');
  double? Chuyencan = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  // Check for invalid input before calculating GPA
  if (Toan < 0 ||
      Toan > 10 ||
      Van < 0 ||
      Van > 10 ||
      Anh < 0 ||
      Anh > 10 ||
      Lichsu < 0 ||
      Lichsu > 10 ||
      Chuyencan < 0 ||
      Chuyencan > 1 ||
      Toan == null ||
      Van == null ||
      Anh == null ||
      Lichsu == null ||
      Chuyencan == null) {
    print('Khong hop le');
    return;
  }

  double avg = (Toan + Van + Anh + Lichsu) / 4;
  double GPA = avg;
  print('GPA: ${GPA.toStringAsFixed(2)}');
  if (GPA >= 9.0) {
    print('Xuat sac');
    print('Can phat huy');
  } else if (GPA >= 8.0) {
    print('Gioi');
    print(' Can co gang hon nua');
  } else if (GPA >= 6.5) {
    print('Kha');
    print(' Can cham hoc hon');
  } else if (GPA >= 5.0) {
    print(' Trung binh');
    print(' Phai hoc cham hon');
  } else {
    print('Yeu');
    print('Can bo sung nhieu kien thuc');
  }
  bool lenlop = (GPA >= 5.0 &&
      Toan >= 3.5 &&
      Van >= 3.5 &&
      Anh >= 3.5 &&
      Lichsu >= 3.5 &&
      Chuyencan >= 0.8);
  print("Duoc len lop: $lenlop");
}
