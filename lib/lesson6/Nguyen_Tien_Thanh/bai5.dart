void main() {
  // Tạo Map để lưu chi tiêu
  Map<String, double> chiTieu = {
    'Ăn sáng': 30000,
    'Cà phê': 25000,
    'Ăn trưa': 50000,
    'Mua sách': 120000,
    'Gửi xe': 10000,
  };

  // Tính tổng số tiền đã chi
  double tongChi = chiTieu.values.reduce((a, b) => a + b);
  print('Tổng số tiền đã chi: $tongChi VND');

  // Tìm khoản chi nhiều nhất
  var mucChiMax = chiTieu.entries.reduce(
      (a, b) => a.value > b.value ? a : b);
  print('Khoản chi nhiều nhất: ${mucChiMax.key} - ${mucChiMax.value} VND');
}
