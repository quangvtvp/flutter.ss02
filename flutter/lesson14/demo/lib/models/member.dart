// Lớp đơn giản đại diện cho 1 thành viên
// Đây là ví dụ rõ ràng về "Class" trong Dart
class Member {
  final String name; // tên
  final String description; // mô tả
  String? idealJob; // nghề nghiệp phù hợp (có thể gán sau)

  Member({
    required this.name,
    required this.description,
    this.idealJob,
  });
}
