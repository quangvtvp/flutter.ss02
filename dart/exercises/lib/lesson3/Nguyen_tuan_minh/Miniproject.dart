import 'dart:io';

void main() {
  print("Điểm Toán:");
  var a = stdin.readLineSync();
  double toan = double.tryParse(a ?? "") ?? 1234;
  print("Điểm Văn:");
  var b = stdin.readLineSync();
  double van = double.tryParse(b ?? "") ?? 1234;
  print("Điểm ngoại ngữ:");
  var c = stdin.readLineSync();
  double nn = double.tryParse(c ?? "") ?? 1234;
  print("Điểm sử:");
  var d = stdin.readLineSync();
  double su = double.tryParse(d ?? "") ?? 1234;
  print("Chuyên cần(%):");
  var e = stdin.readLineSync();
  double cc = double.tryParse(e ?? "") ?? 1234;
  var GPA = (toan + van + nn + su) / 4;
  if (toan == 1234 ||
      van == 1234 ||
      nn == 1234 ||
      su == 1234 ||
      cc == 1234 ||
      toan < 0 ||
      van < 0 ||
      nn < 0 ||
      su < 0 ||
      cc < 0 ||
      toan > 10 ||
      van > 10 ||
      nn > 10 ||
      su > 10 ||
      cc > 100) {
    print("Điểm không hợp lệ");
  } else if (GPA >= 9.0) {
    print("GPA: $GPA");
    print("Xuất sắc");
  } else if (GPA >= 8.0) {
    print("GPA: $GPA");
    print("Giỏi");
  } else if (GPA >= 6.5) {
    print("GPA: $GPA");
    print("Khá");
  } else if (GPA >= 5.0) {
    print("GPA: $GPA");
    print("Trung bình");
  } else if (GPA < 5.0) {
    print("GPA: $GPA");
    print("Yếu");
  }
  if (toan == 1234 ||
      van == 1234 ||
      nn == 1234 ||
      su == 1234 ||
      cc == 1234 ||
      toan < 0 ||
      van < 0 ||
      nn < 0 ||
      su < 0 ||
      cc < 0 ||
      toan > 10 ||
      van > 10 ||
      nn > 10 ||
      su > 10 ||
      cc > 100) {
    print("Điểm không hợp lệ");
  } else if (GPA >= 5.0 &&
      toan >= 3.5 &&
      van >= 3.5 &&
      nn >= 3.5 &&
      su >= 3.5 &&
      cc >= 80) {
    print("Lên lớp");
  } else {
    print("Ở lại lớp");
  }
}
