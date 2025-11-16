void main() {
  List<double> scores = [9.0, 8.0, 10.0, 7.5, 9.5];
  var Max = scores[0];
  var Min = scores[0];
  for (var score in scores) {
    if (score > Max) {
      Max = score;
    }
    if (score < Min) {
      Min = score;
    }
  }
  print("Điểm thấp nhất: $Min");
  print("Điểm cao nhất: $Max");
  scores.add(8.5);
  var sum = 0.0;
  for (var score in scores) {
    sum += score;
  }
  print("Điểm trung bình: ${sum / scores.length}");
}
