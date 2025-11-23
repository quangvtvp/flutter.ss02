class StudentGrades {
  String studentname;
  double _mathscore = 0.0;
  double _physicscore = 0.0;
  double _chemistryscore = 0.0;

  StudentGrades(this.studentname);

  bool _validateScore(double score) {
    if (score < 0 || score > 10) {
      print('Không hợp lệ: điểm phải từ 0 đến 10');
      return false;
    }
    return true;
  }

  double _calculateAverage() {
    return (_mathscore + _physicscore + _chemistryscore) / 3;
  }

  String _getGrade(double average) {
    if (average >= 8) return 'Giỏi';
    if (average >= 6.5) return 'Khá';
    if (average >= 5) return 'Trung bình';
    // mặc định
    return 'Yếu';
  }

  void updateScore(String subject, double newscore) {
    if (_validateScore(newscore)) {
      switch (subject.toLowerCase()) {
        case 'toán':
          _mathscore = newscore;
          print('Điểm toán đã được cập nhật thành $newscore');
          break;
        case 'lý':
          _physicscore = newscore;
          print('Điểm lý đã được cập nhật thành $newscore');
          break;
        case 'hóa':
          _chemistryscore = newscore;
          print('Điểm hóa đã được cập nhật thành $newscore');
          break;
        default:
          print('Môn học không hợp lệ');
      }
    }
  }

  void showReport() {
    var average = _calculateAverage();
    var grade = _getGrade(average);
    print(
        'Tên học sinh: $studentname, Điểm Toán: $_mathscore, Điểm Lý $_physicscore, Điểm Hóa $_chemistryscore, trung bình: ${average.toStringAsFixed(2)}, Học lực: $grade');
  }
}

void main() {
  var student = StudentGrades('Pham Van Duong');
  student.updateScore('toán', 9.0);
  student.updateScore('lý', 8.0);
  student.updateScore('hóa', 10.0);
  student.showReport();
}
