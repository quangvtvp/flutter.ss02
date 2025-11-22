class StudentGrades {
  String studentName;
  final double _mathScore;
  final double _physicsScore;
  final double _chemistryScore;
  StudentGrades(this.studentName, this._mathScore, this._physicsScore,
      this._chemistryScore);
  // Phương thức tính điểm trung bình
  double _calculateAverage() {
    return (_mathScore + _physicsScore + _chemistryScore) / 3;
  }

  //Kiểm tra điểm hợp lệ (0-10)
  bool _validateScore(double score) {
    return score >= 0 && score <= 10;
  }
}

void main() {
  var student = StudentGrades('Lê Viết Minh Đức', 9.0, 9.5, 8.5);
  if (!student._validateScore(student._mathScore) ||
      !student._validateScore(student._physicsScore) ||
      !student._validateScore(student._chemistryScore)) {
    print('❌ Điểm không hợp lệ! Điểm phải từ 0 đến 10.');
    return;
  }
  print('Tên học sinh: ${student.studentName}');
  print('Điểm Toán: ${student._mathScore}');
  print('Điểm Lý: ${student._physicsScore}');
  print('Điểm Hóa: ${student._chemistryScore}');
  print('Điểm trung bình: ${student._calculateAverage()}');
}
