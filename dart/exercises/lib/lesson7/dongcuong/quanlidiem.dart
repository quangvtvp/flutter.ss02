class StudentGrades {
  String studentName;
  double? _mathScore;
  double? _physicsScore;
  double? _chemistryScore;

  StudentGrades(this.studentName);

  // --- Private methods ---
  bool _validateScore(double score) {
    return score >= 0 && score <= 10;
  }

  double? _calculateAverage() {
    if (_mathScore != null &&
        _physicsScore != null &&
        _chemistryScore != null) {
      return (_mathScore! + _physicsScore! + _chemistryScore!) / 3;
    }
    return null;
  }

  String _getGrade(double average) {
    if (average >= 8) {
      return "Gioi";
    } else if (average >= 6.5) {
      return "Kha";
    } else if (average >= 5) {
      return "Trung binh";
    } else {
      return "Yeu";
    }
  }

  // --- Public methods ---
  void updateScore(String subject, double score) {
    if (!_validateScore(score)) {
      print("Diem phai tu 0 den 10!");
      return;
    }

    switch (subject) {
      case 'Toan':
        _mathScore = score;
        print("Da cap nhat diem Toan: $score");
        break;
      case 'Ly':
        _physicsScore = score;
        print("Da cap nhat diem Ly: $score");
        break;
      case 'Hoa':
        _chemistryScore = score;
        print("Da cap nhat diem Hoa: $score");
        break;
      default:
        print("Mon hoc khong hop le!");
    }
  }

  void showReport() {
    double? avg = _calculateAverage();
    if (avg == null) {
      print("Chua du diem de tao bao cao.");
      return;
    }

    String grade = _getGrade(avg);
    print("BAO CAO HOC TAP:");
    print("Ten hoc sinh: $studentName");
    print("Toan: $_mathScore");
    print("Ly: $_physicsScore");
    print("Hoa: $_chemistryScore");
    print("Diem trung binh: ${avg.toStringAsFixed(2)}");
    print("Xep loai: $grade");
  }
}

void main() {
  var sv = StudentGrades("ten");
  sv.updateScore("Toan", 9.3);
  sv.updateScore("Ly", 9.0);
  sv.updateScore("Hoa", 11); 
  sv.updateScore("Hoa", 9.0);
  sv.showReport();
}
