import 'dart:io';

void main() {
  stdout.write("Nhap mot so khac 0: ");

  // Đọc input từ người dùng
  var input = stdin.readLineSync();

  // Thử chuyển đổi sang số nguyên (int)
  int? h = int.tryParse(input ?? "");

  if (h == null || h == 0) {
    // Kiểm tra input không hợp lệ hoặc bằng 0
    print("Khong hop le hoac so bang 0.");
  } else {
    // 1. Khai báo biến đếm
    int count = 0;

    // 2. Chuyển số âm thành số dương để đếm (ví dụ: -123 có 3 chữ số)
    int tempH = h.abs();

    // 3. Vòng lặp đếm
    // Lặp cho đến khi số tempH bị chia hết và bằng 0
    while (tempH > 0) {
      tempH = tempH ~/ 10; // Chia nguyên cho 10 (loại bỏ chữ số cuối)
      count++; // Tăng biến đếm lên 1
    }

    print("So chu so la: $count");
  }
}
