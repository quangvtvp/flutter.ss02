import 'package:flutter/material.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Set<int> _selectedItems = {};

  void _toggleCheckbox(int index) {
    setState(() {
      if (_selectedItems.contains(index)) {
        _selectedItems.remove(index);
      } else {
        _selectedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                _toggleCheckbox(index);
              },
              leading: Icon(
                Icons.check_circle,
                color: _selectedItems.contains(index)
                    ? const Color.fromARGB(255, 48, 86, 83)
                    : Colors.grey,
              ),
              title: Text('Member ${index + 1}'),
              subtitle: Text('Mo Ta cho member ${index + 1}'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
 
      
       