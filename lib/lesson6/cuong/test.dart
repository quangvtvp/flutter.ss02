import 'dart:io';

void main() {
  List<String> names = ['a', 'b', 'c', 'd'];
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
