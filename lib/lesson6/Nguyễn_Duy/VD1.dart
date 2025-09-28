void main() {
  var monan = ['cơm', 'phở', 'bún'];
  print('món ăn đầu tiên là: ${monan[0]}');
  monan.add('cháo');
  print('các món ăn là: $monan');
  var x = monan.length;
  print('tổng số món ăn là: $x');
  monan.remove('cháo');
  print('các món ăn còn lại là: $monan');
  monan.removeAt(1);
  print('các món ăn còn lại là: $monan');
  for (String monan2 in monan) {
    print('$monan2');
  }
}
