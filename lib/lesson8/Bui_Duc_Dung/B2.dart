
void main() {
  var hs = StudentGrades("Nguyễn Văn An");

  hs.updateScore("Toán", 8.5);
  hs.updateScore("Lý", 7.0);
  hs.updateScore("Hóa", 11.0);
  hs.updateScore("Hóa", 9.0);

  hs.showReport();
}

class StudentGrades {
  double _mathScore = 0;
  double _physicsScore = 0;
  double _chemistryScore = 0;

  String studentName;

  StudentGrades(this.studentName);
  bool _validateScore(double score) {
    return score >= 0 && score <= 10;
  }

  double _calculateAverage() {
    return (_mathScore + _physicsScore + _chemistryScore) / 3;
  }

  String _getGrade(double average) {
    if (average >= 8) return "Giỏi";
    if (average >= 6.5) return "Khá";
    if (average >= 5) return "Trung bình";
    return "Yếu";
  }

  void updateScore(String subject, double score) {
    if (!_validateScore(score)) {
      print("❌ Điểm phải từ 0 đến 10!");
      return;
    }

    switch (subject) {
      case "Toán":
        _mathScore = score;
        break;
      case "Lý":
        _physicsScore = score;
        break;
      case "Hóa":
        _chemistryScore = score;
        break;
      default:
        print("❌ Môn học không hợp lệ!");
        return;
    }

    print("✅ Đã cập nhật điểm $subject: $score");
  }

  void showReport() {
    double avg = _calculateAverage();
    String grade = _getGrade(avg);

    print("\n📊 BÁO CÁO HỌC TẬP: $studentName");
    print("   Toán: $_mathScore");
    print("   Lý: $_physicsScore");
    print("   Hóa: $_chemistryScore");
    print("   Điểm TB: ${avg.toStringAsFixed(2)}");
    print("   Xếp loại: $grade");
  }
}
