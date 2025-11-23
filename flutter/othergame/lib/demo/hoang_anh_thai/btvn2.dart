import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('My Flutter App'))),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Text(
                      'Align boxes to the top',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(width: 50, height: 50, color: Colors.red),
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.green,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      'Center all boxes',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.orange,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.purple,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      'Align boxes to the bottom',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 40),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.redAccent,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.yellowAccent,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.greenAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      'Space between boxes',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 40),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.lightBlue,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.yellow,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.brown,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      'Space around each box',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 40),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.deepOrange,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.deepPurpleAccent,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Text(
                      'Equal space evenly',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.yellowAccent,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.greenAccent,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
