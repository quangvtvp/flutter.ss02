void main() {
  List<int> diem = [9,6,8,4,5];
  int max = diem.reduce((a,b) => a>b ? a : b);
  print('điểm cao nhất:$max');
 double diemtong = 0;
 for(int i= 0; i<diem.length; i++){
  diemtong = diemtong + diem[i];
 }
  double tb = diemtong / diem.length;
  print('điểm trung bình:$tb');
 }


