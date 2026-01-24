// =============================================================================
// TODO MODEL - Định nghĩa cấu trúc dữ liệu Todo
// =============================================================================

class Todo {
  final int? id;
  final String title;
  final bool isDone;

  Todo({this.id, required this.title, this.isDone = false});

  // Chuyển JSON thành Todo object
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isDone: json['is_done'] ?? false,
    );
  }

  // Chuyển Todo thành JSON (nếu cần)
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'is_done': isDone};
  }

  // Tạo bản sao với một số field thay đổi
  Todo copyWith({int? id, String? title, bool? isDone}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
