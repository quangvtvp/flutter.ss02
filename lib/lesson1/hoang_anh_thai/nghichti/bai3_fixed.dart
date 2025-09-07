//code by NotTie
//feat hatsune miku

//                                              {}
//  [][][]  []  []    []    []  []      [][][]  []  []      [][][]
//  []      []  []  []  []  []  []      []      []  []      []
//  []      [][][]  [][][]    []        [][][]  []  []      [][][]
//  []      []  []  []  []    []        []      []  []      []
//  [][][]  []  []  []  []    []        []      []  [][][]  [][][]
//                    {}

//  [][]    []  []  []  []  []  []  [][][]  [][]
//  []  []  []  []  [][ []  [][ []  []      []  []
//  [][]    []  []  [] ][]  [] ][]  [][][]  [][]
//  []  []  []  []  []  []  []  []  []      []  []
//  []  []    []    []  []  []  []  [][][]  []  []

// chạy file runner.dart để nhập liệu trong terminal
import 'dart:io';

void main() {
  List<String> thongtinsv = [];
  var hangmuc = [
    'Tên: ',
    'Tuổi: ',
    'Điểm trung bình: ',
    'Giới tính: ',
    'Mã số sinh viên: ',
  ];
  print("Nhập thông tin sinh viên ");
  for (int i = 0; i < hangmuc.length; i++) {
    stdout.write(hangmuc[i]);
    String? a = stdin.readLineSync();
    thongtinsv.add(a ?? "");
  }
  for (int i = 0; i < hangmuc.length; i++) {
    if (thongtinsv[i].isEmpty) {
      thongtinsv[i] = "Chưa nhập";
    }
  }
  print("\nThông tin sinh viên vừa nhập:");
  for (int i = 0; i < hangmuc.length; i++) {
    print("${hangmuc[i]}${thongtinsv[i]}");
  }
  return;
}
