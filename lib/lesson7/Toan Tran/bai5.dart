//Bài 5: Bảng điểm học sinh.//
import 'dart:io';
import 'dart:convert';

// -------------------- CLASS STUDENT --------------------
class Student {
  String name;
  int age;
  double grade;
  String classId;

  Student(this.name, this.age, this.grade, this.classId);

  @override
  String toString() =>
      '$name (tuổi: $age, điểm: ${grade.toStringAsFixed(1)}, lớp: $classId)';

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'grade': grade,
        'classId': classId,
      };

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['name'],
      json['age'],
      (json['grade'] as num).toDouble(),
      json['classId'],
    );
  }
}

// -------------------- HÀM TIỆN ÍCH --------------------

// Hàm bỏ dấu tiếng Việt
String removeVietnameseTones(String str) {
  const Map<String, String> accentMap = {
    'à': 'a', 'á': 'a', 'ạ': 'a', 'ả': 'a', 'ã': 'a', 'â': 'a', 'ầ': 'a', 'ấ': 'a',
    'ậ': 'a', 'ẩ': 'a', 'ẫ': 'a', 'ă': 'a', 'ằ': 'a', 'ắ': 'a', 'ặ': 'a', 'ẳ': 'a', 'ẵ': 'a',
    'è': 'e', 'é': 'e', 'ẹ': 'e', 'ẻ': 'e', 'ẽ': 'e', 'ê': 'e', 'ề': 'e', 'ế': 'e', 'ệ': 'e', 'ể': 'e', 'ễ': 'e',
    'ì': 'i', 'í': 'i', 'ị': 'i', 'ỉ': 'i', 'ĩ': 'i',
    'ò': 'o', 'ó': 'o', 'ọ': 'o', 'ỏ': 'o', 'õ': 'o', 'ô': 'o', 'ồ': 'o', 'ố': 'o', 'ộ': 'o', 'ổ': 'o', 'ỗ': 'o',
    'ơ': 'o', 'ờ': 'o', 'ớ': 'o', 'ợ': 'o', 'ở': 'o', 'ỡ': 'o',
    'ù': 'u', 'ú': 'u', 'ụ': 'u', 'ủ': 'u', 'ũ': 'u', 'ư': 'u', 'ừ': 'u', 'ứ': 'u', 'ự': 'u', 'ử': 'u', 'ữ': 'u',
    'ỳ': 'y', 'ý': 'y', 'ỵ': 'y', 'ỷ': 'y', 'ỹ': 'y', 'đ': 'd'
  };
  accentMap.forEach((k, v) => str = str.replaceAll(k, v));
  return str.toLowerCase();
}

// Nhập số nguyên hợp lệ
int inputInt(String message) {
  while (true) {
    stdout.write(message);
    String? line = stdin.readLineSync(encoding: utf8);
    if (line != null && int.tryParse(line) != null) return int.parse(line);
    print('⚠ Vui lòng nhập một số nguyên hợp lệ!');
  }
}

// Nhập số thực hợp lệ
double inputDouble(String message) {
  while (true) {
    stdout.write(message);
    String? line = stdin.readLineSync(encoding: utf8);
    if (line != null && double.tryParse(line) != null) return double.parse(line);
    print('⚠ Vui lòng nhập một số hợp lệ!');
  }
}

// Nhập học sinh từ người dùng
Student inputStudent() {
  stdout.write('Nhập tên học sinh: ');
  String name = stdin.readLineSync(encoding: utf8) ?? '';
  int age = inputInt('Nhập tuổi: ');
  double grade = inputDouble('Nhập điểm: ');
  stdout.write('Nhập lớp: ');
  String classId = stdin.readLineSync(encoding: utf8) ?? '';
  return Student(name, age, grade, classId);
}

// Lọc theo classId & grade >= 8
List<Student> filterByClassAndGrade(List<Student> list, String classId) {
  return list.where((s) => s.classId == classId && s.grade >= 8.0).toList();
}

// Sắp xếp grade ↓, name ↑
void sortByGradeAndName(List<Student> list) {
  list.sort((a, b) {
    if (b.grade != a.grade) return b.grade.compareTo(a.grade);
    return a.name.compareTo(b.name);
  });
}

// Tìm kiếm đa điều kiện
List<Student> searchStudents({
  required List<Student> students,
  String keyword = '',
  int? minAge,
  int? maxAge,
  double? minGrade,
}) {
  return students.where((s) {
    bool matchKeyword = keyword.isEmpty ||
        removeVietnameseTones(s.name).contains(removeVietnameseTones(keyword));
    bool matchAge =
        (minAge == null || s.age >= minAge) && (maxAge == null || s.age <= maxAge);
    bool matchGrade = minGrade == null || s.grade >= minGrade;
    return matchKeyword && matchAge && matchGrade;
  }).toList();
}

// Top 3 học sinh mỗi lớp
void printTop3EachClass(List<Student> students) {
  Map<String, List<Student>> grouped = {};
  for (var s in students) grouped.putIfAbsent(s.classId, () => []).add(s);

  print('\n📘 Top 3 học sinh mỗi lớp (theo grade ↓):');
  grouped.forEach((classId, list) {
    list.sort((a, b) => b.grade.compareTo(a.grade));
    print('\n$classId:');
    for (var s in list.take(3)) print('  - ${s.name} (${s.grade})');
  });
}

// Lưu dữ liệu vào file JSON
void saveToFile(List<Student> students, String filename) {
  File file = File(filename);
  List<Map<String, dynamic>> jsonList = students.map((s) => s.toJson()).toList();
  file.writeAsStringSync(jsonEncode(jsonList));
}

// Đọc dữ liệu từ file JSON
List<Student> loadFromFile(String filename) {
  File file = File(filename);
  if (!file.existsSync()) return [];
  String content = file.readAsStringSync();
  List<dynamic> jsonList = jsonDecode(content);
  return jsonList.map((e) => Student.fromJson(e)).toList();
}

// -------------------- MAIN --------------------
void main() {
  const filename = 'students.json';
  List<Student> students = loadFromFile(filename);

  // Nếu file trống, thêm dữ liệu mặc định
  if (students.isEmpty) {
    students = [
      Student('Minh', 16, 9.1, '10A1'),
      Student('Linh', 15, 8.7, '10A1'),
      Student('An', 16, 7.9, '10A1'),
      Student('Tuấn', 17, 8.3, '10A2'),
      Student('Vy', 16, 9.5, '10A2'),
      Student('Hải', 17, 8.9, '10A2'),
      Student('Nam', 15, 9.0, '10A3'),
      Student('Thảo', 16, 7.5, '10A3'),
      Student('Khang', 17, 8.2, '10A3'),
      Student('Mai', 16, 9.4, '10A1'),
    ];
  }

  // Thêm học sinh mới
  stdout.write('Bạn có muốn thêm học sinh mới không? (y/n): ');
  String? ans = stdin.readLineSync(encoding: utf8)?.toLowerCase();
  while (ans == 'y') {
    Student newStudent = inputStudent();
    students.add(newStudent);
    print('✅ Đã thêm học sinh: $newStudent\n');
    stdout.write('Bạn có muốn thêm học sinh nữa không? (y/n): ');
    ans = stdin.readLineSync(encoding: utf8)?.toLowerCase();
  }

  // 1️⃣ Lọc theo classId & grade >= 8
  stdout.write('Nhập classId để lọc (vd: 10A2): ');
  String classId = stdin.readLineSync(encoding: utf8) ?? '';
  List<Student> filtered = filterByClassAndGrade(students, classId);
  sortByGradeAndName(filtered);

  print('\n🎯 Danh sách học sinh lớp $classId có grade >= 8.0:');
  if (filtered.isEmpty) print('Không có học sinh nào.');
  else filtered.forEach((s) => print('  - $s'));

  // 2️⃣ Tìm kiếm đa điều kiện
  print('\n🔍 Tìm kiếm học sinh theo nhiều điều kiện:');
  stdout.write('Nhập từ khóa (tên, có thể bỏ trống): ');
  String keyword = stdin.readLineSync(encoding: utf8) ?? '';
  stdout.write('Nhập tuổi tối thiểu (hoặc Enter để bỏ qua): ');
  int? minAge = int.tryParse(stdin.readLineSync(encoding: utf8) ?? '');
  stdout.write('Nhập tuổi tối đa (hoặc Enter để bỏ qua): ');
  int? maxAge = int.tryParse(stdin.readLineSync(encoding: utf8) ?? '');
  stdout.write('Nhập điểm tối thiểu (hoặc Enter để bỏ qua): ');
  double? minGrade = double.tryParse(stdin.readLineSync(encoding: utf8) ?? '');

  List<Student> searchResult = searchStudents(
      students: students,
      keyword: keyword,
      minAge: minAge,
      maxAge: maxAge,
      minGrade: minGrade);

  print('\n📋 Kết quả tìm kiếm:');
  if (searchResult.isEmpty) print('Không tìm thấy học sinh nào phù hợp.');
  else searchResult.forEach((s) => print('  - $s'));

  // 3️⃣ Top 3 học sinh mỗi lớp
  printTop3EachClass(students);

  // 4️⃣ Lưu dữ liệu vào file JSON
  saveToFile(students, filename);
  print('\n💾 Danh sách học sinh đã được lưu vào "$filename".');
}
