import 'dart:async';

void main() {
  Map<String, int> students = {
    'Thai': 85,
    'Thai2': 92,
    'Hoang Thai': 78,
    'Thai Hoang': 90,
  };
  int dem = 0;
  students.forEach((key, value) {
    if (key.contains('Thai')) {
      dem++;
    }
  });
  print('Số học sinh có tên chứa "Thai" là: $dem');
}
