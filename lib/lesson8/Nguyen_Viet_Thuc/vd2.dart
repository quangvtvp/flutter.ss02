void main() {
  StudentGrades studentGrades = StudentGrades("Nguyen Van A", 8.5, 7.0, 9.0);

  print("Học sinh: ${studentGrades.studentName}");
  if (studentGrades._validateScore(studentGrades._mathScore) &&
      studentGrades._validateScore(studentGrades._physicsScore) &&
      studentGrades._validateScore(studentGrades._chemistryScore)) {
    print("Điểm trung bình: ${studentGrades._caculateAverage()}");
  } else {
    print("Không thể tính điểm trung bình do có điểm không hợp lệ.");
  }
}

class StudentGrades {
  String? studentName;
  double _mathScore = 0.0;
  double _physicsScore = 0.0;
  double _chemistryScore = 0.0;

  StudentGrades(this.studentName, this._mathScore, this._physicsScore,
      this._chemistryScore);

  bool _validateScore(double score) {
    if (score < 0 || score > 10) {
      return false;
    }
    return true;
  }

  String _caculateAverage() {
    return ((_mathScore + _physicsScore + _chemistryScore) / 3)
        .toStringAsFixed(2);
  }
}
