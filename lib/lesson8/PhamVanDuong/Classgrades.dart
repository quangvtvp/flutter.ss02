class StudentGrades {
  String studentName;
  double _mathScore = 9.0;
  double _physicsScore = 8.0;
  double _chemistryScore = 10.0;

  StudentGrades(this.studentName);

  bool _validateScore(double score) {
    if (score < 0 || score > 10) {
      print('không hợp lệ điểm phải từ 0 đến 10');
      return false;
    }
    return true;
  }

  double _CalculateAverage() {
    return (_mathScore + _physicsScore + _chemistryScore) / 3;
  }

  String _getGrade(double average) {
    if (average >= 8.0) return 'Giỏi';
    if (average >= 6.5) return 'Khá';
    if (average >= 5.0) return 'Trung bình';
    return 'Yếu';
  }
}

void main() {
  var student = StudentGrades('Pham Van Duong');
  var average = student._CalculateAverage();
  var grade = student._getGrade(average);
  print(
      'Tên học sinh: ${student.studentName}, Điểm trung bình: ${average.toStringAsFixed(2)}, Học lực: $grade');
}
