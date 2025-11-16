import 'dart:io';

void main() {
  Map<String, double> subjects = {};

  while (true) {
    print('\n===== CHƯƠNG TRÌNH QUẢN LÝ MÔN HỌC =====');
    print('1. Thêm môn học');
    print('2. In bảng điểm');
    print('3. Tính điểm trung bình');
    print('4. Tìm môn có điểm giỏi (>= 8.0)');
    print('5. Tìm kiếm môn học theo tên');
    print('6. Thoát');
    stdout.write('Chọn chức năng (1-6): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addSubject(subjects);
        break;
      case '2':
        printSubjects(subjects);
        break;
      case '3':
        calculateAverage(subjects);
        break;
      case '4':
        findGoodSubjects(subjects);
        break;
      case '5':
        searchSubject(subjects);
        break;
      case '6':
        print('Kết thúc chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại.');
    }
  }
}

/// Thêm môn học
void addSubject(Map<String, double> subjects) {
  stdout.write('Nhập tên môn học: ');
  String? name = stdin.readLineSync();

  stdout.write('Nhập điểm môn $name: ');
  double? score = double.tryParse(stdin.readLineSync() ?? '');

  if (name == null ||
      name.isEmpty ||
      score == null ||
      score < 0 ||
      score > 10) {
    print('Dữ liệu không hợp lệ!');
    return;
  }

  subjects[name] = score;
  print('Đã thêm môn "$name" với điểm $score.');
}

/// In bảng điểm
void printSubjects(Map<String, double> subjects) {
  if (subjects.isEmpty) {
    print('Chưa có dữ liệu môn học.');
    return;
  }

  print('\n===== BẢNG ĐIỂM =====');
  subjects.forEach((subject, score) {
    print('$subject: $score');
  });
}

/// Tính điểm trung bình
void calculateAverage(Map<String, double> subjects) {
  if (subjects.isEmpty) {
    print('Chưa có dữ liệu môn học.');
    return;
  }

  double avg = subjects.values.reduce((a, b) => a + b) / subjects.length;
  print('Điểm trung bình: ${avg.toStringAsFixed(2)}');
}

/// Tìm các môn có điểm giỏi (>= 8)
void findGoodSubjects(Map<String, double> subjects) {
  List<String> goodSubjects =
      subjects.entries.where((e) => e.value >= 8.0).map((e) => e.key).toList();

  if (goodSubjects.isEmpty) {
    print('Không có môn nào đạt điểm giỏi.');
  } else {
    print('Các môn đạt điểm giỏi: ${goodSubjects.join(', ')}');
  }
}

/// Tìm kiếm môn học theo tên
void searchSubject(Map<String, double> subjects) {
  stdout.write('Nhập tên môn cần tìm: ');
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print('Tên môn học không hợp lệ.');
    return;
  }

  if (subjects.containsKey(name)) {
    print('Môn "$name" có điểm là: ${subjects[name]}');
  } else {
    print('Không tìm thấy môn "$name".');
  }
}
