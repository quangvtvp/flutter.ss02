void main() {
  List<String> food = ['hoa qua', ' mi', 'do an vat'];
  print(' mon dau tien la:${food[0]}');
  food.add('bun');
  print('tong so mon an la:${food.length}');
  food.remove(90);
  food.removeAt(4 - 1);
  print('danh sach mon an la:$food');
}
