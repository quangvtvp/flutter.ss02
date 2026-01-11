import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/color_picker.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/lightbuld.dart';
import 'package:lesson14_member_funny_game/thuannd/member_screen_v5_gemini.dart';

void main() {
  runApp(MyNavigatorApp());
}

// viet my navigator app
class MyNavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuNavigatorScreen(),
    );
  }
}

// viet class menu navigator screen
class MenuNavigatorScreen extends StatefulWidget {
  @override
  State<MenuNavigatorScreen> createState() => _MenuNavigatorScreenState();
}

class _MenuNavigatorScreenState extends State<MenuNavigatorScreen> {

  Color colors = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors,
      appBar: AppBar(title: Text('Menu Navigator')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.looks_one, size: 24, color: Colors.blue),
            title: Text(
              'Level 1',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Điều huớng cơ bản'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Chức năng đang phát triển')),
              );
              // navigator scree
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.looks_two, size: 24, color: Colors.blue),
            title: Text(
              'Level 2',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Điều hướng và truyền dữ liệu'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: 
                    (context) => MemberFunnyGameScreenV5(name: 'Thức', desc: 'thích học Lý')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.looks_3, size: 24, color: Colors.blue),
            title: Text(
              'Level 3',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Điều hướng và nhận dữ liệu'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () async {
              var colorResult = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColorPicker(),
                ),
              );
              setState(() {
                colors = colorResult ?? Colors.white;
              });
              
            },
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context)=> LightBulb(),),);
          }, 
          child: Text('Next Screen'),),
      ),
    );
  }
}
