void main() {
  String header = '   ';
  for (int i = 1; i <= 9; i++) {
    header += i.toString().padLeft(4);
  }
  print(header);

  for (int j = 1; j <= 9; j++) {
    String row = j.toString().padLeft(2) + " |";
    for (int i = 1; i <= 9; i++) {
      row += (i * j).toString().padLeft(4);
    }
    print(row);
  }
}
