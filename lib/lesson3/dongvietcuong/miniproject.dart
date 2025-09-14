import 'dart:io';
void main() {
  stdout.write("Nhập điểm Toán: ");
  double toan = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Nhập điểm Văn: ");
  double van = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Nhập điểm Ngoại ngữ: ");
  double nn = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Nhập điểm Lịch sử: ");
  double su = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Nhập chuyên cần (%): ");
  double cc = double.parse(stdin.readLineSync() ?? '0');
  double gpa = (toan + van + nn + su) / 4;
  double gpaRounded = double.parse(gpa.toStringAsFixed(2));
  String xeploai;
  String advice;

  if (gpa >= 9.0) {
    xeploai = "Xuất sắc";
    advice = "Tiếp tục phát huy để giữ thành tích.";
  } else if (gpa >= 8.0) {
    xeploai = "Giỏi";
    advice = "hãy duy trì phong độ để đạt Xuất sắc.";
  } else if (gpa >= 6.5) {
    xeploai = "Khá";
    advice = "hãy cố gắng hơn để đạt Giỏi.";
  } else if (gpa >= 5.0) {
    xeploai = "Trung bình";
    advice = " Hãy dành thêm thời gian ôn tập, đặc biệt các môn điểm thấp.";
  } else {
    xeploai = "Yếu";
    advice = "Cần cải thiện ngay các môn yếu và tăng chuyên cần.";
  }

  bool lenLop = gpa >= 5.0 &&
      toan >= 3.5 &&
      van >= 3.5 &&
      nn >= 3.5 &&
      su >= 3.5 &&
      cc >= 80;
  print("\n--- KẾT QUẢ ---");
  print("GPA: $gpaRounded");
  print("Xếp loại: $xeploai");
  print("Đủ điều kiện lên lớp: $lenLop");
  print ("Lời khuyên: $advice");
}
