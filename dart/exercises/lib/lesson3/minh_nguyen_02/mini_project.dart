import 'dart:io';

void main() {
  print('nhap diem mon toan:');
  var toan = double.tryParse(stdin.readLineSync()!);
  print('nhap diem mon van:');
  var van = double.tryParse(stdin.readLineSync()!);
  print('nhap diem ngoai ngu:');
  var ngoaingu = double.tryParse(stdin.readLineSync()!);
  print('nhap diem mon lich su:');
  var lichsu = double.tryParse(stdin.readLineSync()!);
  print('nhap diem chuyen can (%):');
  var chuyencan = double.tryParse(stdin.readLineSync()!);
  if (toan == null ||
      van == null ||
      ngoaingu == null ||
      chuyencan == null ||
      lichsu == null ||
      toan < 0 ||
      van < 0 ||
      ngoaingu < 0 ||
      chuyencan < 0 ||
      lichsu < 0 ||
      toan > 10 ||
      van > 10 ||
      ngoaingu > 10 ||
      chuyencan > 100 ||
      lichsu > 10) {
    print('khong hop le');
    return;
  }
  var gpa = ((toan + van + ngoaingu + lichsu) / 4).toStringAsFixed(2);
  var GPA = double.parse(gpa);
  if (GPA >= 9) {
    print(
        'GPA:$GPA, xep loai: xuat sac, loi khuyen: ban hoc rat tot, hay tiep tuc phat huy');
  } else if (GPA >= 8) {
    print(
        'GPA:$GPA,xep loai: gioi, loi khuyen: ban hoc tot, hay tiep tuc phat huy');
  } else if (GPA >= 6.5) {
    print(
        'GPA:$GPA, xep loai:kha, loi khuyen: co gang hon nua de dat thanh tich tot hon');
  } else {
    print(
        'GPA:$GPA, xep loai:yeu, loi khuyen: ban can no luc hon de cai thien diem so');
  }
  if (GPA >= 5 &&
      toan >= 3.5 &&
      van >= 3.5 &&
      ngoaingu >= 3.5 &&
      lichsu >= 3.5 &&
      chuyencan >= 80) {
    print('ban du dieu kien len lop');
  } else {
    print('ban khong du dieu kien len lop');
  }
}
