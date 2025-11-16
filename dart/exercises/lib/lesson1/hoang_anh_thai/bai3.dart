void main() {
  (String, int, double, String, int) sv = ('Thái', 16, 8.9, 'Nam', 08102009);
  print('THÔNG TIN SINH VIÊN');
  print('Tên: ${sv.$1}');
  print('Tuổi: ${sv.$2}');
  print('Điểm trung bình: ${sv.$3}');
  print('Giới tính: ${sv.$4}');
  print('Mã số sinh viên: ${sv.$5}');
  return;
}
