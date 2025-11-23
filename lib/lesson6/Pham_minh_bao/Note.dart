import 'dart:io';

void main() {
  var fst = 'THAINGUYEN';
  print('*' * fst.length);
  List<String> A = List.filled(fst.length, "*");
  List<String> B = fst.split('');
  do {
    stdout.write('Nhập vào 1 kí tự bạn đoánn:');
    String? n = (stdin.readLineSync() ?? '').toUpperCase();
    if (n.length != 1) {
        print('vui lòng nhập lại');
        continue;
    } else {
        for (var i =0; i < fst.length; i++) {
            if (n == B[i]) {
                A[i] = n;
            }
        } print(A.join());
    }
  } while (A.contains("*"));
  print('Chúc mừng bạn đã đoán đúng!');
}
