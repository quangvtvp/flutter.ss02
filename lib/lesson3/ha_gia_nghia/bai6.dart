import 'dart:io';
void main() {
  print('nhap so luong hang con lai:');
  int sohangconlai = int.tryParse (stdin.readLineSync() ?? '');
  if (sohangconlai ==null || sohangconlai<0 ) {
    print('khong hop le'); 
  } else if (sohangconlai <0) {
    print ('giỡn quài ní , chơi vậy ai chơi,nhập lại đi');
  } else if ( sohangconlai == 0) {
    print ('hết hàng rồi nha quý vị');
  } else if (sohangconlai >0 && sohangconlai <=5) {
  print('sắp hết rồi nhanh thì còn chậm thì hetcuu');
} else if (sohangconlai >5) {
  print('còn nhiều lắm cứ từ từ mà lựa');
}
}