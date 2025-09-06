// Bài tập 3: Gom nhóm thông tin bằng record//
void main() {
  String name = 'Trần anh Toàn';
  int tuoi = 16;
  double score = 29.92;
  String gioitinh = 'Nam';
  var ToanTran = ('Trần Anh Toàn', 16, 29.92, 'Nam');
  print('Tên: ${ToanTran.$1}, Tuổi: ${ToanTran.$2}, Điểm thi Đại học: ${ToanTran.$3}, Giới tính: ${ToanTran.$4}');
}