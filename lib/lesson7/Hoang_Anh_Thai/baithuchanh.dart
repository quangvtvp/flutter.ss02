class StudentGrades {
  double _mathScore = 0;
  double _physicsScore = 0;
  double _chemistryScore = 0;
  String studentname;

  StudentGrades(this.studentname, this._mathScore, this._physicsScore,
      this._chemistryScore);

  bool _valid(double a) {
    return a >= 0 && a <= 10;
  }

  _calculateAverage() {
    return (_mathScore + _physicsScore + _chemistryScore) / 3;
  }

  _getGrade(double avg) {
    if (avg >= 8) {
      return 'Giỏi';
    } else if (avg >= 6.5) {
      return 'Khá';
    } else if (avg >= 5) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  void updateScore(String subject, double Score) {
    switch (subject.toLowerCase()) {
      case 'Toán':
        bool a = _valid(Score);
        if (a == false) {
          print('Điểm không hợp lệ');
        } else {
          _mathScore = Score;
        }
      case 'Lý':
        bool a = _valid(Score);
        if (a == false) {
          print('Điểm không hợp lệ');
        } else {
          _physicsScore = Score;
        }
      case 'Hóa':
        bool a = _valid(Score);
        if (a == false) {
          print('Điểm không hợp lệ');
        } else {
          _chemistryScore = Score;
        }
      default:
        print('Môn học không hợp lệ');
    }
  }

  void showInfo() {
    double avg = _calculateAverage();
    String grade = _getGrade(avg);
    print('Tên sinh viên: $studentname');
    print('Điểm Toán: $_mathScore');
    print('Điểm Lý: $_physicsScore');
    print('Điểm Hóa: $_chemistryScore');
    print('Điểm trung bình: ${avg.toStringAsFixed(2)}');
    print('Xếp loại: $grade');
  }
}

void main() {
  var student = [
    StudentGrades('Nguyễn Văn A', 7.5, 8.0, 6.0),
    StudentGrades('Trần Thị B', 5.0, 4.5, 9.0)
  ];
  student[1].showInfo();
  student[1].updateScore('Toán', 9.0);
  student[1].updateScore('Lý', 11.0);
  student[1].updateScore('Hóa', 5.5);
  student[1].showInfo();
}
