void main() {
  List<double> diem = [9, 3.5 , 7.5 , 10 ,6];
  double diemcaonhat = diem[0];
  double diemthapnhat = diem[0];
  for (int i=0; i<diem.length; i++) {
    if(diem[i]>diemcaonhat) {
      diemcaonhat = diem[i];
      print('diem cao nhat la: $diemcaonhat');
    }
    for(int i=0;i<diem.length ; i++) {
      if(diem[i]<diemthapnhat) {
        diemthapnhat = diem[i];
        print('diem thap nhat la: $diemthapnhat');
      }
    }
  }
}