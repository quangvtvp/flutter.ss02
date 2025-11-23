void main() {
  List<int> diemso = [6, 7, 8, 10, 5];
  var max = diemso[0];
  var sum = 0;
  var min = diemso[0];
  diemso.add(9);
  for (var i = 0; i < diemso.length; i++) {
    sum += diemso[i];
    if (diemso[i] < min) {
      min = diemso[i];
    }
    if (diemso[i] > max) {
      max = diemso[i];
    }
  }
  print("diemso lon nhat la: $max");
  print("diem so nho nhat la: $min");
  print("diem trung binh la: ${sum / diemso.length}");
}
