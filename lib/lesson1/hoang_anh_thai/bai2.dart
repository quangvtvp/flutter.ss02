import 'dart:io';
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

void main() {
  // nhập liệu smh
  stdout.writeln("Nhập số A:");
  int? a = int.tryParse(stdin.readLineSync()!);
  stdout.writeln("Nhập số B:");
  int? b = int.tryParse(stdin.readLineSync()!);

  //kiểm tra null
  if (a == null || b == null) {
    print("GIá trị không phải là số");
    return;
  }

  // in kết quả
  print("Tổng của A và B là: ${a + b}");
  print("Hiệu của A và B là: ${a - b}");
  print("Tích của A và B là: ${a * b}");

  //in thương
  if (b != 0) {
    print("Thương của A và B là: ${a / b}");
  } else {
    print("Không thể chia cho 0");
  }

  return;
}
//code by NotTie
//feat hatsune miku
//tự code, gpt 20%