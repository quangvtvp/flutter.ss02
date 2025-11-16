import 'dart:io';
void main() {
  print("nhap vao so nam");
  String? input = stdin.readLineSync() ?? '';
  int? nam = int.tryParse(input ?? '');
  if (nam != null && nam >= 0){
    if (((nam % 4) == 0 && (nam % 100)!=0 ) || ((nam % 400) == 0)){
      print("nam $nam la nam nhuan");
    } else {
      print("nam $nam khong phai la nam nhuan");
    }
  }else {print ("vui long nhap so nam");}
}
