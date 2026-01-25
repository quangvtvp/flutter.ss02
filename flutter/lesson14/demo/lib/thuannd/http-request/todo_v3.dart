import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// =============================================================================
// TODO APP V3 - Thêm UPDATE và DELETE
// =============================================================================
// Trong phiên bản này, chúng ta sẽ:
// - Thêm API để cập nhật trạng thái todo (PATCH)
// - Thêm API để xóa todo (DELETE)
// - Hoàn thiện đầy đủ CRUD operations
// =============================================================================

class Todo {
  final int? id;
  final String title;
  final bool isDone;

  Todo({this.id, required this.title, this.isDone = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isDone: json['is_done'] ?? false,
    );
  }
}

class TodoListV3 extends StatefulWidget {
  const TodoListV3({super.key});

  @override
  State<TodoListV3> createState() => _TodoListV3State();
}

class _TodoListV3State extends State<TodoListV3> {
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];
  bool _isLoading = true;

  // ĐẶT TÊN CỦA BẠN Ở ĐÂY
  final String appKey = 'student_name';

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  // ============ GỌI API ============

  // GET - Lấy danh sách todo
  Future<void> _loadTodos() async {
    setState(() => _isLoading = true);

    try {
      final url = Uri.parse(
        'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos?app_key=eq.$appKey&order=created_at.desc',
      );

      final response = await http.get(
        url,
        headers: {
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          _todos = jsonList.map((json) => Todo.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Không thể tải danh sách: $e');
    }
  }

  // POST - Thêm todo mới
  Future<void> _addTodo() async {
    if (_controller.text.isEmpty) return;

    try {
      final url = Uri.parse(
        'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos',
      );

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
          'Prefer': 'return=representation',
        },
        body: jsonEncode({
          'app_key': appKey,
          'title': _controller.text,
          'is_done': false,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> result = jsonDecode(response.body);
        final newTodo = Todo.fromJson(result.first);

        setState(() {
          _todos.insert(0, newTodo);
          _controller.clear();
        });
      } else {
        throw Exception('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Không thể thêm: $e');
    }
  }

  // PATCH - Cập nhật trạng thái todo (MỚI!)
  Future<void> _toggleTodo(Todo todo) async {
    try {
      // URL với query parameter ?id=eq.xxx để chỉ định record cần update
      // eq = equals (bằng)
      final url = Uri.parse(
        'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos?id=eq.${todo.id}',
      );

      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
        },
        // Chỉ gửi field cần thay đổi
        body: jsonEncode({'is_done': !todo.isDone}),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // Cập nhật UI
        setState(() {
          final index = _todos.indexWhere((t) => t.id == todo.id);
          if (index != -1) {
            _todos[index] = Todo(
              id: todo.id,
              title: todo.title,
              isDone: !todo.isDone,
            );
          }
        });
      } else {
        throw Exception('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Không thể cập nhật: $e');
    }
  }

  // DELETE - Xóa todo (MỚI!)
  Future<void> _deleteTodo(Todo todo) async {
    try {
      // URL với query parameter ?id=eq.xxx để chỉ định record cần xóa
      final url = Uri.parse(
        'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos?id=eq.${todo.id}',
      );

      final response = await http.delete(
        url,
        headers: {
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // Xóa khỏi UI
        setState(() {
          _todos.removeWhere((t) => t.id == todo.id);
        });
      } else {
        throw Exception('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Không thể xóa: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List V3 - CRUD'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadTodos),
        ],
      ),
      body: Column(
        children: [
          // Input field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Nhập công việc...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addTodo(),
            ),
          ),
          // Add button
          ElevatedButton(onPressed: _addTodo, child: const Text('Thêm')),
          const SizedBox(height: 16),
          // Todo list
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _todos.isEmpty
                ? const Center(child: Text('Chưa có công việc nào'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final todo = _todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.isDone,
                          // Bây giờ đã hoạt động!
                          onChanged: (_) => _toggleTodo(todo),
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          // Bây giờ đã hoạt động!
                          onPressed: () => _deleteTodo(todo),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
