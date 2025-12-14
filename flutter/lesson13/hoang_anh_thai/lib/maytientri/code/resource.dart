import 'dart:math';
import 'package:flutter/material.dart';

// Tổng số nghề nghiệp
const int soNgheNghiep = 33;

// Danh sách nghề nghiệp
List<String> nghenghiep1 = [
  'Bác sĩ',
  'Kĩ sư',
  'Giáo viên',
  'Luật sư',
  'Y tá',
  'Dược sĩ',
  'Nha sĩ',
  'Kế toán',
  'Kiểm toán',
  'Nhà báo',
  'Nhà văn',
  'Biên tập viên',
  'Thợ làm bánh',
  'Đầu bếp',
  'Barista',
  'Nông dân',
  'Ngư dân',
  'Thợ mộc',
  'Thợ điện',
  'Thợ hàn',
  'Lái xe',
  'Phi công',
  'Tiếp viên hàng không',
  'Họa sĩ',
  'Nhà thiết kế',
  'Kiến trúc sư',
  'Chuyên viên marketing',
  'Chuyên viên IT',
  'Lập trình viên',
  'Chuyên gia an ninh mạng',
  'Nhà nghiên cứu',
  'Giảng viên',
  'Huấn luyện viên',
];

// Danh sách joke
List<String> joke = [
  'Thuốc đắng có tác dụng, nhưng lương cũng đắng!',
  'Xây dựng giấc mơ, nhưng lương xây dựng từ từ.',
  'Dạy học để tương lai sáng, nhưng lương thì tối!',
  'Bào chữa cho công lý, nhưng ví bào chữa tiền!',
  'Chăm sóc bệnh nhân như gia đình, lương thì như... bạn!',
  'Làm thuốc chữa bệnh, nhưng không chữa được bệnh... hẹp lương!',
  'Răng sạch tiền không sạch, hay là tiền sạch rồi!',
  'Tính toán chi chi, tính chi được tiền chẳng?',
  'Kiểm tra tài chính, kiểm tra chi tiêu cũng của công ty!',
  'Viết tin nóng hổi, nhưng lương lạnh lẽo!',
  'Viết sách dài dòng, lương lại ngắn ngủi!',
  'Chỉnh sửa từng chi tiết, chỉnh chi được tiêu gì?',
  'Làm bánh ngon miệng, nhưng lương ít chịu nổi!',
  'Nấu ăn cho người khác no, bản thân chắt chiu chi tiêu!',
  'Pha cà phê sạch sẽ, phа tiền thì sạch ghế!',
  'Trồng trọt mưu sinh, trồng lương cũng vất vả!',
  'Câu cá mỗi ngày, câu lương khó lắm!',
  'Chạm khắc tỉ mỉ, chạm lương cũng tinh tế!',
  'Chiếu sáng cuộc sống, nhưng lương thì... cắt điện!',
  'Hàn sắt kỳ công, hàn tiền để... kỳ công hơn!',
  'Lái xe an toàn, lái lương cũng... an toàn an toàn!',
  'Bay cao chạm mây, lương bay mất tiêu!',
  'Phục vụ tận tâm, tâm lương lại hẹp!',
  'Vẽ bức tranh đẹp, vẽ lương thì... trắng!',
  'Thiết kế tinh xảo, thiết kế chi tiêu cũng tinh xảo!',
  'Xây dựng đan xen, lương xây dựng từ từ!',
  'Tiếp thị sản phẩm, tiếp thị lương khó quá!',
  'Code ngàn dòng, lương... dòng suốt ngàn!',
  'Debug lỗi cả ngày, debug lương khó hơn debug code!',
  'Bảo vệ dữ liệu, bảo vệ lương... không đủ an ninh!',
  'Nghiên cứu đủ thứ, chỉ không nghiên cứu ra tiền!',
  'Giảng dạy kiến thức, giảng... chi tiêu cho học sinh!',
  'Rèn luyện sức khỏe, rèn... luyện lương thì... rèn!',
];

int ranIndexNgheNghiep() {
  final random = Random();

  return random.nextInt(soNgheNghiep);
}

class DuLieuTienTri {
  final String ten;
  final String moTa;
  final String ngheNghiep;
  final String joke;

  DuLieuTienTri({
    required this.ten,
    required this.moTa,
    required this.ngheNghiep,
    required this.joke,
  });
}

ValueNotifier<Map<String, DuLieuTienTri>> ketQuaNotifier = ValueNotifier({});

void themKetQua(String ten, String moTa) {
  int index = ranIndexNgheNghiep();

  final newResult = DuLieuTienTri(
    ten: ten,
    moTa: moTa,
    ngheNghiep: nghenghiep1[index],
    joke: joke[index],
  );

  final currentResults = ketQuaNotifier.value;
  currentResults[ten] = newResult;
  ketQuaNotifier.value = Map.from(currentResults);
}
