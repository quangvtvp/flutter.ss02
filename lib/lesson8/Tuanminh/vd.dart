class Studentgrade {
  var _mathscore;
  var _physicscore;
  var _chemistryscore;
  String Studentname;
  Studentgrade(this.Studentname, this._mathscore, this._physicscore,
      this._chemistryscore);

  Studentgrade_validateScores(mathscore, physicscore, chemistryscore) {
    if (mathscore < 0 ||
        mathscore > 10 ||
        physicscore < 0 ||
        physicscore > 10 ||
        chemistryscore < 0 ||
        chemistryscore > 10) {
      print("Không hợp lệ");
    }
  }

  Studentgrade_calculateAverage(mathscore, physicscore, chemistryscore) {
    return print(
        "Điểm trung bình:  ${(mathscore + physicscore + chemistryscore) / 3} ");
  }
}

void main() {
  var student = Studentgrade("minh", 10, 9, 8);
  student.Studentgrade_calculateAverage(10, 9, 8);
}
