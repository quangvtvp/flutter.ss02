void main() {
  Map<String, double> chitieu = {
    'An sang': 20000,
    'An trua': 40000,
    'An toi': 45000,
    'Di chuyen': 10000,
    'Uong nuoc': 30000,
  };
  double tongchitieu = 0;
  for (var tien in chitieu.values) {
    tongchitieu += tien;
  }
  String khoanmax = chitieu.keys.first;
  double max = chitieu.values.first;
  chitieu.forEach((khoan, tien) {
    if (tien > max) {
      max = tien;
      khoanmax = khoan;
    }
  });

  print('Tong so tien chi: $tongchitieu');
  print('Chi tieu lon nhat la:$khoanmax - $max ');
}
