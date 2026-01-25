import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: todolist(),
    debugShowCheckedModeBanner: false,
  ));
}
class todolist extends StatefulWidget {
  const todolist({super.key});

  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter a new todo item', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: null, child: Text('Add Todo')),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(value: false, onChanged: (value) {}),
                      title: Text('Todo item $index'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
