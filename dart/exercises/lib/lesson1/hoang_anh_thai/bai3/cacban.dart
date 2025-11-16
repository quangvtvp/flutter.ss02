import 'dart:io';
import 'dart:math';

void main() {
  // Nhập điểm các môn
  print('Nhập điểm Toán (0–10): ');
  double? math = double.tryParse(stdin.readLineSync() ?? '');
  if (math == null || math < 0 || math > 10) {
    print('Điểm không hợp lệ.');
    return;
  }

  print('Nhập điểm Văn (0–10): ');
  double? literature = double.tryParse(stdin.readLineSync() ?? '');
  if (literature == null || literature < 0 || literature > 10) {
    print('Điểm không hợp lệ.');
    return;
  }

  print('Nhập điểm Ngoại ngữ (0–10): ');
  double? foreignLanguage = double.tryParse(stdin.readLineSync() ?? '');
  if (foreignLanguage == null || foreignLanguage < 0 || foreignLanguage > 10) {
    print('Điểm không hợp lệ.');
    return;
  }

  print('Nhập điểm Lịch sử (0–10): ');
  double? history = double.tryParse(stdin.readLineSync() ?? '');
  if (history == null || history < 0 || history > 10) {
    print('Điểm không hợp lệ.');
    return;
  }

  // Nhập chuyên cần
  print('Nhập chuyên cần (%): ');
  double? attendance = double.tryParse(stdin.readLineSync() ?? '');
  if (attendance == null || attendance < 0 || attendance > 100) {
    print('Chuyên cần không hợp lệ.');
    return;
  }

  // Tính GPA
  double gpa = ((math + literature + foreignLanguage + history) / 4 * 100)
          .roundToDouble() /
      100;

  // Xếp loại
  String classification;
  if (gpa >= 9.0) {
    classification = 'Xuất sắc';
  } else if (gpa >= 8.0) {
    classification = 'Giỏi';
  } else if (gpa >= 6.5) {
    classification = 'Khá';
  } else if (gpa >= 5.0) {
    classification = 'Trung bình';
  } else {
    classification = 'Yếu';
  }

  // Kiểm tra điều kiện lên lớp
  bool canPromote = gpa >= 5.0 &&
      math >= 3.5 &&
      literature >= 3.5 &&
      foreignLanguage >= 3.5 &&
      history >= 3.5 &&
      attendance >= 80.0;

  // Lời khuyên học tập
  String advice;
  double minScore = [math, literature, foreignLanguage, history].reduce(min);
  if (gpa < 5.0) {
    advice =
        'Nền tảng yếu. Ôn căn bản 45–60 phút/ngày, tập trung vào môn thấp nhất (${minScore.toStringAsFixed(2)}).';
  } else if (gpa < 6.5) {
    advice =
        'Cần cải thiện đều. Đặt mục tiêu +1.0 GPA trong 4–6 tuần, tăng luyện bài mức vừa.';
  } else if (gpa < 8.0) {
    advice = 'Khá tốt! Luyện đề nâng cao 1–2 môn sở trường để bứt phá.';
  } else if (gpa < 9.0) {
    advice = 'Rất tốt! Duy trì thói quen học và thử thách đề phân hoá.';
  } else {
    advice = 'Xuất sắc! Có thể hỗ trợ bạn bè hoặc tham gia đội tuyển.';
  }

  // In báo cáo
  print('===== BÁO CÁO HỌC LỰC =====');
  print('- Toán: ${math.toStringAsFixed(2)}');
  print('- Văn: ${literature.toStringAsFixed(2)}');
  print('- Ngoại ngữ: ${foreignLanguage.toStringAsFixed(2)}');
  print('- Lịch sử: ${history.toStringAsFixed(2)}');
  print('Chuyên cần: ${attendance.toStringAsFixed(2)}%');
  print('GPA: ${gpa.toStringAsFixed(2)}');
  print('Xếp loại: $classification');
  print('Đủ điều kiện lên lớp: ${canPromote ? 'Có' : 'Không'}');
  print('Lời khuyên: $advice');
}
