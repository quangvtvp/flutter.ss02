import 'dart:io';

void main() {
  Map<String,int> ct = {
    'Ăn sáng' : 10000,
    'Ăn trưa' : 64000,
    'Ăn tối' : 87000,
    'Đi chơi' : 220000,
    'tiền đóng học' : 3000000,
  };double tongchi = 0;
  for (var tc in ct.values) {
    tongchi += tc;
    print('Số tiền đã tiêu :${tongchi.toStringAsFixed(0)} VNĐ');
  }
String max = '';
 int maxx = 0;
 ct.forEach((k, v) {
  if(v > maxx) {
    maxx = v;
    max = k;
  }
 });
 print('Tiền tiêu nhiều nhất là: $max với số tiền là ${maxx.toStringAsFixed((0))} vnd');
}