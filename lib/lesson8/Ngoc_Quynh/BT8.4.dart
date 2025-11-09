class StudentGrades {
  String studentName;
  double? _mathScore;
  double? _physicalScore;
  double? _chemistryScore;

  StudentGrades(this.studentName);

  bool _validateScore(double score) {
    if (score < 0 || score > 10) {
      print(' Điểm phải từ 0 đến 10!');
      return false;
    }
    return true;
  }

  void setScores(double math, double physical, double chemistry) {
    if (!_validateScore(math)) {
      print('Diem k hop le');
      return;
    }
    if (!_validateScore(physical)) {
      print('Diem k hop le');
      return;
    }
    if (!_validateScore(chemistry)) {
      print('Diem k hop le');
      return;
    }
    _mathScore = math;
    _physicalScore = physical;
    _chemistryScore = chemistry;
    print('Nhap diem thanh  cong cho $studentName');
  }

  double _calculateAverage() {
    if (_mathScore == null ||
        _physicalScore == null ||
        _chemistryScore == null) {
      print('Chua nhap du diem');
      return 0;
    }
    return (_mathScore! + _physicalScore! + _chemistryScore!) / 3;
  }

  String _getGrade(double average) {
    if (average >= 8.0) return 'Giỏi';
    if (average >= 6.5) return 'Khá';
    if (average >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  void updateScore(String subject, double score) {
    if (!_validateScore(score)) {
      return;
    }

    switch (subject.toLowerCase()) {
      case 'toán':
        _mathScore = score;
        print(' Đã cập nhật điểm Toán: $score');
        break;
      case 'lý':
        _physicalScore = score;
        print(' Đã cập nhật điểm Lý: $score');
        break;
      case 'hóa':
        _chemistryScore = score;
        print(' Đã cập nhật điểm Hóa: $score');
        break;
      default:
        print('Môn học không hợp lệ (Chỉ nhận: Toán, Lý, Hóa)');
    }
  }

  void showReport() {
    double avg = _calculateAverage();
    String grade = _getGrade(avg);

    print(' BÁO CÁO HỌC TẬP: $studentName');
    print('   Toán: $_mathScore');
    print('   Lý: $_physicalScore');
    print('   Hóa: $_chemistryScore');
    print('   Điểm TB: ${avg.toStringAsFixed(2)}');
    print('   Xếp loại: $grade');
  }
}

void main() {
  var student = StudentGrades('ABCDEF');

  student.updateScore('Toán', 10);
  student.updateScore('Lý', 10);
  student.updateScore('Hóa', 10);
  student.updateScore('Hóa', 15.0);

  student.showReport();
}
