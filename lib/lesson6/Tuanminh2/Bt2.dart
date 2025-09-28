void main() {
  var diemso = [9, 9.5, 8, 8.5, 8.8];
  diemso.add(10);
  print(diemso);
  var max = diemso[0];
  var min = diemso[diemso.length - 1];
  for (var a in diemso) {
    if (a > max) {
      max = a;
    }
    if (a < min) {
      min = a;
    }
  }
  print("Điểm cao nhất: $max");
  print("Điểm thấp nhất: $min");
  var sum = 0.0;
  for (var b in diemso) {
    sum += b;
  }
  print("điểm trung bình: ${sum / diemso.length}");
}
