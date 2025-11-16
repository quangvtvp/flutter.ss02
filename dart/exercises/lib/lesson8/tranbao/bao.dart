class StudentGrades {
  String studentName;
  final double _mathScore;
  final double _physicsScore;
  final double _chemistryScore;

  StudentGrades(this.studentName, this._mathScore, this._physicsScore,
      this._chemistryScore);
  double get mathScore => _mathScore;
  double get physicsScore => _physicsScore;
  double get chemistryScore => _chemistryScore;
  double get average => (_mathScore + _physicsScore + _chemistryScore) / 3;

  bool _validateScore(double score) {
    return score >= 0 && score <= 10;
  }

  bool isValid() {
    return _validateScore(_mathScore) &&
        _validateScore(_physicsScore) &&
        _validateScore(_chemistryScore);
  }
}

void main() {
  var student = StudentGrades('hocsinh', 6.5, 9.5, 2.0);

  if (!student.isValid()) {
    print(' Điểm không hợp lệ! Điểm phải từ 0 đến 10.');
    return;
  }

  print('Tên học sinh: ${student.studentName}');
  print('Điểm Toán: ${student.mathScore}');
  print('Điểm Lý: ${student.physicsScore}');
  print('Điểm Hóa: ${student.chemistryScore}');
  print('Điểm trung bình: ${student.average.toStringAsFixed(2)}');
}
