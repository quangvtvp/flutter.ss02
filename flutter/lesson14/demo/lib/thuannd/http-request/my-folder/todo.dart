import 'package:flutter/material.dart';

class MyTodoWidget extends StatefulWidget {
  const MyTodoWidget({super.key});

  @override
  State<MyTodoWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Todo Widget')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter todo item',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {}, child: Text('Add Todo')),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Todo Item $index'),
                      leading: Checkbox(value: false, onChanged: (value) {}),
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
