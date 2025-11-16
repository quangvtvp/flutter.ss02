// Chương trình in bảng cửu chương từ 1 đến 9

void main() {
  for (var n = 1; n <= 9; n++) {
    print('*** BẢNG $n ***');
    for (var i = 1; i <= 9; i++) {
      print('$n x $i = ${n * i}');
    }

    print('*****************');
  }
}
