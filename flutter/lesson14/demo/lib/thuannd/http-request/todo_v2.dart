import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// =============================================================================
// TODO APP V2 - Tích hợp API cơ bản (GET + POST)
// =============================================================================
// Trong phiên bản này, chúng ta sẽ:
// - Tích hợp API để lấy danh sách todo từ server
// - Tích hợp API để thêm todo mới
// - Đặt tất cả URL và API key trực tiếp trong code để dễ hiểu
// =============================================================================

class Todo {
  final int? id;
  final String title;
  final bool isDone;

  Todo({this.id, required this.title, this.isDone = false});

  // Chuyển JSON từ server thành Todo object
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isDone: json['is_done'] ?? false,
    );
  }
}

class TodoListV2 extends StatefulWidget {
  const TodoListV2({super.key});

  @override
  State<TodoListV2> createState() => _TodoListV2State();
}

class _TodoListV2State extends State<TodoListV2> {
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];
  bool _isLoading = true;

  // ĐẶT TÊN CỦA BẠN Ở ĐÂY (ví dụ: thuannd, minhpn, student01)
  final String appKey = 'student_name';

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  // ============ GỌI API ============

  // GET - Lấy danh sách todo từ server
  Future<void> _loadTodos() async {
    setState(() => _isLoading = true);

    try {
      // Tạo URL với đầy đủ thông tin
      // - Base URL: https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1
      // - Endpoint: /todos
      // - Query params: ?app_key=eq.xxx để lọc theo app_key của mình
      final url = Uri.parse(
        'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos?app_key=eq.$appKey&order=created_at.desc',
      );

      // Gửi GET request
      final response = await http.get(
        url,
        headers: {
          // API key để xác thực với Supabase
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
        },
      );

      // Kiểm tra kết quả
      if (response.statusCode == 200) {
        // Parse JSON array thành List<Todo>
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
          // Header này yêu cầu server trả về dữ liệu vừa tạo
          'Prefer': 'return=representation',
        },
        body: jsonEncode({
          'app_key': appKey,
          'title': _controller.text,
          'is_done': false,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Server trả về array, lấy phần tử đầu tiên
        final List<dynamic> result = jsonDecode(response.body);
        final newTodo = Todo.fromJson(result.first);

        setState(() {
          // Thêm vào đầu danh sách (vì order by desc)
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

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List V2 - API'),
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
                          // Chưa implement - sẽ làm ở V3
                          onChanged: null,
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
                          // Chưa implement - sẽ làm ở V3
                          onPressed: null,
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
