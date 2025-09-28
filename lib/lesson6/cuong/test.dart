import 'dart:io';

void main() {
    List<String> names = [];
  stdout.write("Nhập số lượng bạn trong lớp: ");
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print("Số lượng không hợp lệ!");
    return;
  }
  for (var i = 0; i < n; i++) {
    stdout.write("Nhập tên bạn thứ ${i + 1}: ");
    String? name = stdin.readLineSync();
    if (name != null && name.isNotEmpty) {
      names.add(name);
    } else {
      names.add("Không tên");
    }
  }

  List<Map<String, String>> students = [];
  for (var i = 0; i < names.length; i++) {
    stdout.writeln("hay nhap so thich cua ${names[i]}:");
    String? soThich = stdin.readLineSync();
    if (soThich != null && soThich.isNotEmpty) {
      students.add({'name': names[i], 'hobby': soThich});
    } else {
      students.add({'name': names[i], 'hobby': 'Khong co so thich'});
    }
  }
  for (var student in students) {
    print("name: ${student['name']}, sở thích: ${student['hobby']}");
  }
}
