import 'dart:io';
void main() {
print('nhập giờ:');
 int? gio = int.tryParse(stdin.readLineSync() ?? '');
if (gio ==null) {
  print('giá trị không hợp lệ');
} else if (gio <0 || gio >23) {
  print('giờ không hợp lệ');
} else if (0<= gio && gio <12) {
  print('chào buổi sáng');
} else if (12<=gio && gio <18) {
  print('chào buổi chiều '); 
} else if (gio >=18 && gio <=23) {
  print('chào buổi tối');
}
}
