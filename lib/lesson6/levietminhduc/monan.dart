void main() {
  List<String> food = [
    'Gâu gâu',
    'Bánh mì',
    'Gạo luộc',
    'Dưa hấu',
    'Bánh cuốn',
  ];
  print('thức ăn là $food');
  print('Món ăn dầu tiên là ${food[0]}');
  food.add('Phở bò');
  print('Danh sách món ăn sau khi thêm là $food');
  dynamic n = food.length;
  print('số lượng món ăn là $n');
  List<String> monHoc = ['Toán', 'Lý', 'Hóa', 'Sinh'];

  print('Danh sách môn học:');
  monHoc.forEach((mon) => print('* $mon'));
  List<String> monHoc1 = ['Toán', 'Lý', 'Hóa', 'Sinh'];

  print('Danh sách môn học:');
  for (String mon1 in monHoc1) {
    print('- $mon1');
  }
  monHoc1.remove('Lý');
  monHoc1.removeAt(0);
  monHoc1.insert(0, 'Văn');
  monHoc1.add('Anh');
  monHoc1[1] = 'GDCD';
  print('Danh sách mới là: $monHoc1');
  List<String> monHoc2 = ['Toán', 'Lý', 'Hóa', 'Sinh'];

  print('Danh sách môn học:');
  for (int i = 0; i < monHoc2.length; i++) {
    print('${i + 1}. ${monHoc2[i]}');
  }
  for (var food1 in food) {
    print('Tôi thích ăn $food1');
  }
}
