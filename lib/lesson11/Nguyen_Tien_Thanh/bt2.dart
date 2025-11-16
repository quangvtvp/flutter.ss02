// Hàm tải thông tin học sinh
Future<String> taiThongTinHocSinh(String maHocSinh) async {
  await Future.delayed(Duration(seconds: 2)); // mô phỏng thời gian tải

  if (maHocSinh == "HS001") {
    return "Nguyễn Văn A - Lớp 10A1";
  } else if (maHocSinh == "HS002") {
    return "Trần Thị B - Lớp 10A2";
  } else {
    throw Exception("Không tìm thấy học sinh");
  }
}

void main() async {
  // Danh sách 3 mã cần thử
  List<String> danhSachMa = ["HS001", "HS002", "HS999"];

  for (String ma in danhSachMa) {
    try {
      String info = await taiThongTinHocSinh(ma);
      print("Kết quả cho $ma: $info");
    } catch (e) {
      print("Lỗi khi tải $ma: $e");
    }
  }
}
