import 'dart:io';

void main() {
  Map<String, double> expenses = {}; // lưu các khoản chi tiêu

  print('=== CHƯƠNG TRÌNH QUẢN LÝ CHI TIÊU ===');
  while (true) {
    stdout.write('Nhập tên khoản chi (hoặc bấm Enter để kết thúc): ');
    String? name = stdin.readLineSync();

    // nếu người dùng bấm Enter => dừng nhập
    if (name == null || name.isEmpty) break;

    stdout.write('Nhập số tiền chi cho "$name": ');
    double? amount = double.tryParse(stdin.readLineSync() ?? '');

    if (amount == null || amount < 0) {
      print('Dữ liệu không hợp lệ, hãy thử lại.');
      continue;
    }

    expenses[name] = amount;
  }

  // Nếu không có dữ liệu
  if (expenses.isEmpty) {
    print('Chưa có khoản chi tiêu nào.');
    return;
  }

  // 1️⃣ Tính tổng số tiền
  double total = expenses.values.reduce((a, b) => a + b);
  print('\nTổng số tiền đã chi: $total');

  // 2️⃣ Tìm khoản chi lớn nhất
  var maxEntry = expenses.entries.reduce(
    (a, b) => a.value > b.value ? a : b,
  );
  print('Khoản chi nhiều nhất là: "${maxEntry.key}" - ${maxEntry.value}');

  // 3️⃣ In danh sách chi tiêu
  print('\n=== DANH SÁCH CHI TIÊU ===');
  expenses.forEach((name, amount) {
    print('$name: $amount');
  });
}
