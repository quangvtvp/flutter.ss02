void main() {
  List<double> diem =[9 ,4.5 ,6.5 , 8, 6];
  List<double> diemgioi = diem.where((d) => d>=8.0).toList();
  print('diem gioi la: $diemgioi');
  List<double> diemchiahetcho5 = diem.where((d) => d%5==0).toList();
  print('diem chia het cho 5 la: $diemchiahetcho5');
}