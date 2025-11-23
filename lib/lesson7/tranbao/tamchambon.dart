class StudentGrades {
  String studentName;
  double _mathScore = 0.0;
  double _physicsScore = 0.0;
  double _chemistryScore = 0.0;

  StudentGrades(this.studentName);

  bool _validateScore(double score) {
    if (score < 0 || score > 10) {
      print('điểm 0-10');
      return false;
    }
    return true;
  }

  double _calculateAverage() {
    return (_mathScore + _physicsScore + _chemistryScore) / 3;
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
        _physicsScore = score;
        print(' Đã cập nhật điểm Lý: $score');
        break;
      case 'hóa':
        _chemistryScore = score;
        print('Đã cập nhật điểm Hóa: $score');
        break;
      default:
    }
  }

  void showReport() {
    double avg = _calculateAverage();
    String grade = _getGrade(avg);

    print('\nBÁO CÁO HỌC TẬP: $studentName');
    print('   Toán: $_mathScore');
    print('   Lý: $_physicsScore');
    print('   Hóa: $_chemistryScore');
    print('   Điểm TB: ${avg.toStringAsFixed(2)}');
    print('   Xếp loại: $grade');
  }
}

void main() {
  var student = StudentGrades('Nguyễn Văn An');

  student.updateScore('Toán', 8.5);
  student.updateScore('Lý', 7.0);
  student.updateScore('Hóa', 12.0);
  student.updateScore('Hóa', 9.0);

  student.showReport();
}
