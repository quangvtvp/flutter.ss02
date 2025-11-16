import 'dart:io';

void main() {
  print("Nhập hạng thành viên (bronze/silver/gold/platinum):");
  String? input = stdin.readLineSync();
  String rank =
      (input ?? '').toLowerCase();
  int discount;
  switch (rank) {
    case "bronze":
      discount = 0;
      break;
    case "silver":
      discount = 5;
      break;
    case "gold":
      discount = 10;
      break;
    case "platinum":
      discount = 15;
      break;
    default:
      print(" Hạng thành viên không hợp lệ!");
      return;
  }

  print("Hạng $rank được giảm giá $discount%");
}
