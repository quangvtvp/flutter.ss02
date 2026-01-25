import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/color_picker.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/lightbuld.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/Minh%20bao/cardsgame.dart';
import 'package:lesson14_member_funny_game/thuannd/member_screen_v5_gemini.dart';

void main() {
  runApp(NavigatorApp());
}

class NavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuNavigatorApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuNavigatorApp extends StatefulWidget {
  @override
  State<MenuNavigatorApp> createState() => _MenuNavigatorAppState();
}

class _MenuNavigatorAppState extends State<MenuNavigatorApp> {
  Color colors = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors,
      appBar: AppBar(centerTitle: true, title: Text('Menu Navigator App')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.circle_rounded,
                color: Colors.limeAccent,
                size: 30,
              ),
              title: Text(
                'Level 1',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Điều hướng cơ bản',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Bạn đã chọn Level 1')));

                //Navigator screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                  //level 1 --> SecondScreen --> LightBulb --> level 1
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.circle_rounded,
                color: Colors.orangeAccent,
                size: 30,
              ),
              title: Text(
                'Level 2',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'điều hướng và truyền dữ liệu',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Bạn đã chọn Level 2')));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MemberFunnyGameScreenV5(name: 'Minh Bảo', desc: 'abc'),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.circle_rounded,
                color: Colors.orange,
                size: 30,
              ),
              title: Text(
                'Level 3',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'điều hướng và nhận dữ liệu trả về',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                var color = await Navigator.push( // bien color de nhan du lieu tra ve
                  context,
                  MaterialPageRoute(builder: (context) => ColorPicker()),
                );
                setState(() {
                  colors = color; // state de thay doi mau nen
                });
              },
            ),
          ],
        ),
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
          child: Text('Next Screen'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LightBulb()),
            );
          },
        ),
      ),
    );
  }
}
