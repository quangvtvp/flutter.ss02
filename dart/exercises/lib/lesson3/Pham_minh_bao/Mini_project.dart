//Đầu vào: Điểm số các môn Toán, Văn, Ngoại ngữ và Lịch sử (0–10), chuyên cần (%).
//Đầu ra: GPA (làm tròn 2 chữ số), Xếp loại (Xuất sắc/Giỏi/Khá/TB/Yếu), Đủ điều kiện lên lớp (true/false), Lời khuyên học tập.
//Quy tắc gợi ý:

//Xếp loại theo GPA: ≥9.0 XS, ≥8.0 Giỏi, ≥6.5 Khá, ≥5.0 TB, <5.0 Yếu.
//Lên lớp nếu: GPA ≥ 5.0 và không môn nào < 3.5 và chuyên cần ≥ 80%.

import 'dart:io';

void main() {
  print('Nhập điểm môn Toán: ');
  String? T = stdin.readLineSync();
  double? toan = double.tryParse(T!);
  print('Nhập điểm môn Văn: ');
  String? V = stdin.readLineSync();
  double? van = double.tryParse(V!);
  print('Nhập điểm môn Ngoại ngữ: ');
  String? N = stdin.readLineSync();
  double? anh = double.tryParse(N!);
  print('Nhập điểm môn Lịch sử: ');
  String? L = stdin.readLineSync();
  double? su = double.tryParse(L!);
  print('Nhập điểm chuyên cần (%): ');
  String? C = stdin.readLineSync();
  double? chuyencan = double.tryParse(C!);
  if (toan == null ||
      van == null ||
      anh == null ||
      su == null ||
      chuyencan == null) {
    print('Vui lòng nhập đúng định dạng số!');
    return main();
  } else {
    double TB = (toan + van + anh + su) / 4;
    double CC = chuyencan / 10;
    String gpa1 = (TB * 0.8 + CC * 0.2).toStringAsFixed(2);
    double gpa = double.parse(gpa1);
    String xeploai = (gpa >=9) ? 'Xuất sắc' : (gpa >=8) ? 'Giỏi' : (gpa >=6.5) ? 'Khá' : (gpa >=5) ? 'Trung bình' : 'Yếu';
    if (gpa >=5 && toan >=3.5 && van >= 3.5 && anh >= 3.5 && su >= 3.5 && chuyencan >=80) {
      print('GPA của bạn là $gpa, xếp loại $xeploai, đủ điều kiện lên lớp!');
    } else {
      print('GPA của bạn là $gpa, xếp loại $xeploai, không đủ điều kiện lên lớp!');
    }
  }
}
