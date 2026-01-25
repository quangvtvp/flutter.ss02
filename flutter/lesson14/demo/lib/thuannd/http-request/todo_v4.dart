import 'package:flutter/material.dart';
import 'todo_model.dart';
import 'todo_api_service.dart';

// =============================================================================
// TODO APP V4 - Tách riêng Config, Model, Service
// =============================================================================
// Trong phiên bản này, chúng ta đã tách code thành nhiều file:
// - api_config.dart     → Cấu hình URL, API key
// - todo_model.dart     → Định nghĩa class Todo
// - todo_api_service.dart → Tất cả API calls
// - todo_v4.dart        → UI widget (file này)
//
// Lợi ích:
// - Code gọn gàng, dễ đọc
// - Dễ maintain và mở rộng
// - Có thể tái sử dụng ở nhiều nơi
// - Dễ test từng phần riêng biệt
// =============================================================================

class TodoListV4 extends StatefulWidget {
  const TodoListV4({super.key});

  @override
  State<TodoListV4> createState() => _TodoListV4State();
}

class _TodoListV4State extends State<TodoListV4> {
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  // ============ GỌI API (sử dụng TodoApiService) ============

  Future<void> _loadTodos() async {
    setState(() => _isLoading = true);

    try {
      // Chỉ cần gọi service, không cần biết chi tiết URL hay headers
      final todos = await TodoApiService.getTodos();
      setState(() {
        _todos = todos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Không thể tải danh sách: $e');
    }
  }

  Future<void> _addTodo() async {
    if (_controller.text.isEmpty) return;

    try {
      final newTodo = await TodoApiService.addTodo(_controller.text);
      setState(() {
        _todos.insert(0, newTodo);
        _controller.clear();
      });
    } catch (e) {
      _showError('Không thể thêm: $e');
    }
  }

  Future<void> _toggleTodo(Todo todo) async {
    try {
      await TodoApiService.updateTodoStatus(todo.id!, !todo.isDone);
      setState(() {
        final index = _todos.indexWhere((t) => t.id == todo.id);
        if (index != -1) {
          // Sử dụng copyWith để tạo bản sao với isDone thay đổi
          _todos[index] = todo.copyWith(isDone: !todo.isDone);
        }
      });
    } catch (e) {
      _showError('Không thể cập nhật: $e');
    }
  }

  Future<void> _deleteTodo(Todo todo) async {
    try {
      await TodoApiService.deleteTodo(todo.id!);
      setState(() {
        _todos.removeWhere((t) => t.id == todo.id);
      });
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
        title: const Text('Todo List V4 - Clean Code'),
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
          // Statistics
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Tổng: ${_todos.length}'),
                Text('Hoàn thành: ${_todos.where((t) => t.isDone).length}'),
                Text('Còn lại: ${_todos.where((t) => !t.isDone).length}'),
              ],
            ),
          ),
          const SizedBox(height: 8),
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
                          onChanged: (_) => _toggleTodo(todo),
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: todo.isDone ? Colors.grey : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
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
