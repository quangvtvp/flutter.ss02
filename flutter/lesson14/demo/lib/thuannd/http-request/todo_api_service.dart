import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'todo_model.dart';

// =============================================================================
// TODO API SERVICE - Quản lý tất cả API calls
// =============================================================================
// Tách riêng API service để:
// - Code UI gọn gàng hơn
// - Dễ test và maintain
// - Có thể tái sử dụng ở nhiều màn hình
// =============================================================================

class TodoApiService {
  // Headers chung cho mọi request
  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'apikey': ApiConfig.apiKey,
    'Prefer': 'return=representation',
  };

  // GET - Lấy danh sách todo
  static Future<List<Todo>> getTodos() async {
    final url = Uri.parse(
      '${ApiConfig.baseUrl}/todos?app_key=eq.${ApiConfig.appKey}&order=created_at.desc',
    );

    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Không thể tải danh sách todo: ${response.statusCode}');
    }
  }

  // POST - Thêm todo mới
  static Future<Todo> addTodo(String title) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/todos');

    final response = await http.post(
      url,
      headers: _headers,
      body: jsonEncode({
        'app_key': ApiConfig.appKey,
        'title': title,
        'is_done': false,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> result = jsonDecode(response.body);
      return Todo.fromJson(result.first);
    } else {
      throw Exception('Không thể thêm todo: ${response.statusCode}');
    }
  }

  // PATCH - Cập nhật trạng thái todo
  static Future<void> updateTodoStatus(int id, bool isDone) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/todos?id=eq.$id');

    final response = await http.patch(
      url,
      headers: _headers,
      body: jsonEncode({'is_done': isDone}),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Không thể cập nhật todo: ${response.statusCode}');
    }
  }

  // DELETE - Xóa todo
  static Future<void> deleteTodo(int id) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/todos?id=eq.$id');

    final response = await http.delete(url, headers: _headers);

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Không thể xóa todo: ${response.statusCode}');
    }
  }
}
