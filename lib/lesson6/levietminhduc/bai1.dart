import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình quản lý chi tiêu cá nhân 1 ngày!');
  Map<String, double> expenses = {
    'ăn sáng': 15000,
    'ăn trưa': 40000,
    'ăn tối': 50000,
    'đi chơi': 30000,
    'xăng xe': 15000,
    'tiền học': 80000,
  };

  print('Danh sách chi tiêu trong ngày:');
  expenses.forEach((item, cost) {
    print('$item: $cost');
  });

  double totalExpense = expenses.values.reduce((a, b) => a + b);
  print('Tổng chi tiêu trong ngày: $totalExpense');

  chitieuLonNhat(expenses);
}

void chitieuLonNhat(Map<String, double> expenses) {
  String maxItem = '';
  double maxCost = 0;
  expenses.forEach((item, cost) {
    if (cost > maxCost) {
      maxCost = cost;
      maxItem = item;
    }
  });
  print('Chi tiêu lớn nhất là $maxItem: $maxCost');
}