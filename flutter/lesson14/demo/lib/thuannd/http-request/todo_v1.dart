import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// =============================================================================
// TODO APP V1 - Tải danh sách từ Internet (Mock JSON)
// =============================================================================
// Trong phiên bản này, chúng ta sẽ học:
// - Gọi API GET để lấy dữ liệu từ Internet
// - Parse JSON thành danh sách object
// - Thêm todo mới chỉ lưu local (không gửi lên server)
// - Refresh để tải lại dữ liệu từ Internet
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

class TodoListV1 extends StatefulWidget {
  const TodoListV1({super.key});

  @override
  State<TodoListV1> createState() => _TodoListV1State();
}

class _TodoListV1State extends State<TodoListV1> {
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  // ============ GỌI API ============

  // GET - Lấy danh sách todo từ Internet
  Future<void> _loadTodos() async {
    try {
      // URL đơn giản trả về danh sách todo dạng JSON
      final url = Uri.parse('https://dummyjson.com/c/c103-1caf-4265-9779');

      // Gửi GET request
      final response = await http.get(url);

      // Kiểm tra kết quả
      if (response.statusCode == 200) {
        // Parse JSON array thành List<Todo>
        final List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          _todos = jsonList.map((json) => Todo.fromJson(json)).toList();
        });
      } else {
        throw Exception('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Không thể tải danh sách: $e');
    }
  }

  // Thêm todo mới (chỉ lưu local, không gửi lên server)
  void _addTodo() {
    if (_controller.text.isEmpty) return;

    setState(() {
      // Tạo ID tạm thời cho todo mới
      final newId = _todos.isEmpty ? 1 : _todos.last.id! + 1;
      _todos.add(Todo(id: newId, title: _controller.text, isDone: false));
      _controller.clear();
    });
  }

  // Toggle trạng thái (chỉ local)
  void _toggleTodo(int index) {
    setState(() {
      final todo = _todos[index];
      _todos[index] = Todo(
        id: todo.id,
        title: todo.title,
        isDone: !todo.isDone,
      );
    });
  }

  // Xóa todo (chỉ local)
  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
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
        title: const Text('Todo List V1 - Mock API'),
        actions: [
          // Nút refresh để tải lại từ Internet
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadTodos,
            tooltip: 'Tải lại từ server',
          ),
        ],
      ),
      body: Column(
        children: [
          // Thông báo
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.amber.shade100,
            child: const Text(
              '⚠️ Thêm/Sửa/Xóa chỉ lưu local. Refresh sẽ tải lại từ server.',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
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
          ElevatedButton(
            onPressed: _addTodo,
            child: const Text('Thêm (Local)'),
          ),
          const SizedBox(height: 16),
          // Todo list
          Expanded(
            child: _todos.isEmpty
                ? const Center(child: Text('Chưa có công việc nào'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final todo = _todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (_) => _toggleTodo(index),
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
                          onPressed: () => _deleteTodo(index),
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
