import 'dart:io';

void main() {
  List<String> monan = ['Cơm', 'Phở', 'Bún'];
  print(monan);
  print('Nhập món ăn muốn thêm: ');
  String? them = stdin.readLineSync();
  if (them != null && them.isNotEmpty) {
    monan.add(them);
  } else {
    print('Nhập lại');
  }
  print(monan);
}
