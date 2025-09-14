import 'dart:io';

void main() {
  print('nhap hang thanh vien cua ban');
  var hang = stdin.readLineSync();
  if (hang == 'bronze') {
    print('phan tram giam gia cua ban la 0%');
  } else if (hang == 'silver') {
    print('phan tram giam gia cua ban la 5%');
  } else if (hang == 'gold') {
    print('phan tram giam gia cua ban la 10%');
  } else if (hang == 'platinum') {
    print('phan tram giam gia cua ban la 15%');
  } else {
    print('khong hop le');
  }
}
