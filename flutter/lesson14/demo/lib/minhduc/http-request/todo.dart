import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<TodoItem> _todos = [];
  bool _isLoading = true;
  final String appKey = 'minhduc';

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(title: _controller.text));
        _controller.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  @override
  void initState() {
    _loadTodos();
    super.initState();
  }

  Future<void> _loadTodos() async {
    var url = Uri.parse('https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1/todos?app_key=eq.$appKey');
    var response = await http.get(url, headers: {
      'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc',
    }
    );

    // Load todos from local storage or API
    List<dynamic> jsonListItem = jsonDecode(response.body);
    setState(() {
      _todos.clear();
      for (var item in jsonListItem) {
        _todos.add(TodoItem(title: item['title'], isDone: item['isDone'] ?? false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          // Input field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter todo item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Add button
          ElevatedButton(onPressed: _addTodo, child: const Text('Add')),
          const SizedBox(height: 16),
          // Todo list
          Expanded(
            child: ListView.builder(
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
