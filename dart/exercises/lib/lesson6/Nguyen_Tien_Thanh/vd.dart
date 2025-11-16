//import 'dart:math';


//String xaoTronTu(String tuGoc) {
   // List<String> kyTu = tuGoc.replaceAll(' ', '').split('');
    //kyTu.shuffle(Random());
   // return kyTu.join();
//}
import 'dart:io';
void main(){
  String tuGoc = 'hoc tap';
 List<String> tu =  tuGoc.split('');
 print(tu);
 tu.shuffle();
 print(tu);
 String? nhap = stdin.readLineSync();
 if(tuGoc == nhap){
  print('Chuc mung ban da doan dung');
 } else {
  print('chuc bn may man lan sau');
 }
 }
 //String tu = 'Hoc bai';
 //String tuXaoTron = xaoTronTu(tu);
// print('Từ gốc : $tu');
 //print('Từ xáo trộn : $tuXaoTron');

