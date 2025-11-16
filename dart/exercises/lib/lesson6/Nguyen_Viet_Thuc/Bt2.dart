void main() {
  List<double> scores = [9.0, 8.0, 10.0, 7.5, 9.5];
  scores.sort();
  print("Điểm thấp nhất: ${scores.first}");
  print("Điểm cao nhất: ${scores.last}");
  scores.add(8.5);
  var sum = 0.0;
  for (var score in scores) {
    sum += score;
  }
  print("Điểm trung bình: ${sum / scores.length}");
}
