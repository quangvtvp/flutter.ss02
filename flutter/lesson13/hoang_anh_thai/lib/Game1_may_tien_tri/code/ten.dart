import 'package:flutter/material.dart';
import 'resource.dart';

//Column ten() {
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.start,
//    crossAxisAlignment: CrossAxisAlignment.center,
//    children: [SizedBox(height: 25), phinel('thai', 'ngu')],
//  );
//}

class Ten extends StatefulWidget {
  const Ten({Key? key}) : super(key: key);

  @override
  State<Ten> createState() => _Tao();
}

class _Tao extends State<Ten> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [for (var key in lieudu!.keys) {}]);
  }
}

Container phinel(String ten, String info) {
  int a = rannum1to30();
  return Container(
    width: 850,
    height: 100,
    margin: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 241, 216, 255),
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              height: 30,
              width: 695,
              child: Text('Tên: $ten '),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              height: 30,
              width: 695,
              child: Text('Job: ${nghenghiep1[a]}'),
            ),
            SizedBox(height: 3),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              height: 20,
              width: 695,
              child: Text('joke: ${joke[a]}'),
            ),
            SizedBox(height: 2),
          ],
        ),
        SizedBox(width: 25),
        Container(width: 80, height: 100),
      ],
    ),
  );
}

Container pheoni(String ten, String info) {
  int a = rannum1to30();
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
    ),
    child: Row(
      children: [
        // Avatar bên trái
        CircleAvatar(
          radius: 24,
          child: Text(
            ten.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        // Thông tin bên phải
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ten,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(info, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 4),
              Text(
                'Nghề nghiệp tương lai: ${nghenghiep1[a]}',
                style: const TextStyle(
                  color: Colors.teal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
