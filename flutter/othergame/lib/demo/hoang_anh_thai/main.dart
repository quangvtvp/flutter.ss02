import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter To‑Do',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const TodoHomePage(),
    );
  }
}

class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, this.done = false});

  Map<String, dynamic> toJson() => {'title': title, 'done': done};

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      TodoItem(title: json['title'] as String, done: json['done'] as bool);
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<TodoItem> _items = [];
  late SharedPreferences _prefs;
  final String _storageKey = 'flutter_todo_items_v1';

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs.getString(_storageKey);
    if (raw != null) {
      try {
        final list = jsonDecode(raw) as List<dynamic>;
        _items.clear();
        for (final e in list) {
          _items.add(TodoItem.fromJson(Map<String, dynamic>.from(e)));
        }
        setState(() {});
      } catch (e) {
        // ignore parse errors
      }
    }
  }

  Future<void> _saveItems() async {
    final raw = jsonEncode(_items.map((e) => e.toJson()).toList());
    await _prefs.setString(_storageKey, raw);
  }

  Future<void> _addItem(String title) async {
    if (title.trim().isEmpty) return;
    setState(() {
      _items.insert(0, TodoItem(title: title.trim()));
    });
    await _saveItems();
  }

  Future<void> _toggleDone(int index) async {
    setState(() {
      _items[index].done = !_items[index].done;
    });
    await _saveItems();
  }

  Future<void> _removeItem(int index) async {
    final removed = _items.removeAt(index);
    setState(() {});
    await _saveItems();
    // snack with undo
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã xóa "${removed.title}"'),
        action: SnackBarAction(
          label: 'Hoàn tác',
          onPressed: () async {
            setState(() {
              _items.insert(index, removed);
            });
            await _saveItems();
          },
        ),
      ),
    );
  }

  Future<void> _showAddDialog() async {
    final controller = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm nhiệm vụ'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Viết nhiệm vụ...'),
          onSubmitted: (v) {
            Navigator.of(context).pop();
            _addItem(v);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _addItem(controller.text);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final remaining = _items.where((e) => !e.done).length;
    return Scaffold(
      appBar: AppBar(
        title: Text('To‑Do (${remaining})'),
        actions: [
          IconButton(
            tooltip: 'Xóa đã hoàn thành',
            onPressed: () async {
              final before = _items.length;
              _items.removeWhere((e) => e.done);
              if (_items.length != before) {
                setState(() {});
                await _saveItems();
              }
            },
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),
      body: _items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.checklist, size: 72),
                  SizedBox(height: 12),
                  Text('Chưa có nhiệm vụ nào. Bấm + để thêm.'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: item.done,
                      onChanged: (_) => _toggleDone(index),
                    ),
                    title: Text(
                      item.title,
                      style: item.done
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : null,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _removeItem(index),
                    ),
                    onTap: () => _toggleDone(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
