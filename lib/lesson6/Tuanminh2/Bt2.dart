void main() {
  var diemso = [9, 9.5, 8, 8.5, 8.8];
  var max = diemso[0];
  for (var a in diemso) {
    if (a > max) {
      max = a;
    }
  }
  print("Điểm cao nhất: $max");
  diemso.add(10);
  print(diemso);
  var sum = 0.0;
  for (var b in diemso) {
    sum += b;
  }
  print("điểm trung bình: ${sum / diemso.length}");
}
