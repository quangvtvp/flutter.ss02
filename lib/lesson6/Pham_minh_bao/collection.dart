import 'dart:io';
void main() {
  // CÁC CÁCH KHAI BÁO LIST:
  // cách 1:
  List<String> list = ['apple', 'banana', 'orange', 'grape'];
  print(list);

  // cách 2:
  List<int> list1 = [];
  print(list1);

  // cách 3:
  var list2 = [1, 2, 3, 4, 5];
  print(list2);

  // NOTE: 'dynamic' là kiểu dữ liệu có thể chứa mọi kiểu dữ liệu khác
  List<dynamic> list3 = [1, 'A', true, 2.3];
  print(list3);

  // 'length' là thuộc tính trả về độ dài của list:  tên List.length
  print(list.length);

  // Tạo danh sách môn học
  List<String> monHoc = ['Toán', 'Lý', 'Hóa', 'Sinh', 'Văn'];
  print('Danh sách môn học: $monHoc');
  print('Số lượng môn học: ${monHoc.length}');

  // CÁCH TRUY CẬP PHẦN TỬ TRONG LIST:
  print('phần tử thứ 2: ${monHoc[1]}');
  print('phần tử đầu tiên: ${monHoc.first}'); // first: phần tử đầu tiên
  print('phần tử cuối cùng: ${monHoc.last}'); // last: phần tử cuối cùng

  // THÊM/LOẠI BỎ/SỬA PHẦN TỬ VÀO LIST:
  // cách 1: dùng 'add'
  monHoc.add('Anh'); // 'add': chỉ thêm được 1 phần tử vào cuối list
  print('Danh sách môn học sau khi thêm: $monHoc');
  //note: khi thêm phần tử khác kiểu dữ liệu với kiểu dữ liệu của list thì sẽ báo lỗi

  // cách 2: dùng 'addAll'
  monHoc.addAll(['Địa', 'Sử']); // 'addAll': thêm nhiều phần tử vào cuối list
  print('Danh sách môn học sau khi thêm nhiều phần tử: $monHoc');

  // cách 3: dùng 'insert'
  monHoc.insert(2,
      'GDCD'); // 'insert': chèn 1 phần tử vào vị trí có index = 2 (vị trí thứ 3 trong list)
  print('Danh sách môn học sau khi chèn: $monHoc');

  // cách 4: dùng 'insertAll'
  monHoc.insertAll(0, [
    'Thể dục',
    'Quốc phòng'
  ]); // 'insertAll': chèn nhiều phần tử vào vị trí có index = 0 (vị trí đầu tiên trong list)
  print('Danh sách môn học sau khi chèn nhiều phần tử: $monHoc');

  // cách 5: dùng 'remove'
  monHoc.remove('Hóa'); // 'remove': xóa TẤT CẢ phần tử có giá trị = 'Hóa'
  print('Danh sách môn học sau khi xóa: $monHoc');

  // cách 6: dùng 'removeAt'
  monHoc.removeAt(
      3); // 'removeAt': xóa phần tử tại vị trí có index = 3 (vị trí thứ 4 trong list)
  print('Danh sách môn học sau khi xóa phần tử tại vị trí thứ 4: $monHoc');
  // ví dụ thực tế: trong danh sách có 2 phần tử giống nhau, chỉ muốn xóa một phần tử thì dùng 'removeAt'

  // cách 7: dùng 'removeLast'
  monHoc.removeLast(); // 'removeLast': xóa phần tử cuối cùng trong list
  print('Danh sách môn học sau khi xóa phần tử cuối cùng: $monHoc');

  // cách 8: dùng 'clear'
  monHoc.clear(); // 'clear': xóa TẤT CẢ phần tử trong list
  print('Danh sách môn học sau khi xóa tất cả phần tử: $monHoc');

  // cách 9: dùng '[]' để sửa phần tử
  list[0] =
      'A'; // sửa phần tử có index = 0 (phần tử đầu tiên trong list) thành 'A'
  print('List sau khi sửa phần tử đầu tiên: $list');

  // DUYỆT PHẦN TỬ TRONG LIST:
  // cách 1: dùng for (có thể kết hợp điều kiện)
  for (var i = 0; i < list.length; i++) {
    print('phần tử thứ ${i + 1} là: ${list[i]}');
  }

  // cách 2: dùng for..in (không thể kết hợp điều kiện/in tất cả)
  for (var n in list) {
    // sau mỗi lần lặp, n sẽ lần lượt nhận giá trị của từng phần tử trong list
    print('fruits: $n');
  }

  // cách 3: dùng forEach (không thể kết hợp điều kiện/in tất cả)
  for (var n in list) {
    print('fruit: $n');
  }

  // LỌC PHẦN TỬ VỚI 'WHERE'
  // ví dụ thực tế: trong danh sách điểm, lọc ra các điểm >= 8

  List<double> diem = [7.5, 8, 9.5, 6, 8.3, 5];
  // cách 1: dùng for..in kết hợp if
  for (var i in diem) {
    if (i >= 8) {
      print(i);
    }
  }
  // cách 2: dùng 'where'
  diem.where((d) => d >= 8).forEach((d) => print(d));
  // 'where': lọc các phần tử thỏa mãn điều kiện

  // bài tập ví dụ: lọc ra các số chia hết cho 3 trong list
  List<int> so = [1, 213, 34, 213, 1245, 3, 124, 232345, 6875, 5643];
  List<int> chia3 =
      so.where((n) => n % 3 == 0).toList(); // chuyển đổi thành list
  print(chia3);
  // hoặc
  so.where((n) => n % 3 == 0).forEach((n) => stdout.write('$n\t'));

  // TÌM KIẾM PHẦN TỬ
  List<String> fruits = ['apple', 'banana', 'orange', 'grape', 'banana'];
  print(fruits.contains(
      'banana')); // 'contains': kiểm tra phần tử có trong list hay không, trả về true/false
  print(fruits.indexOf(
      'banana')); // 'indexOf': trả về vị trí index của phần tử đầu tiên tìm thấy, nếu không tìm thấy trả về -1

  // KIỂM TRA LIST RỖNG
  List<String> emptyList = [];
  print(emptyList
      .isEmpty); // 'isEmpty': kiểm tra list có rỗng hay không, trả về true/false

  // SẮP XẾP PHẦN TỬ TRONG LIST
  List<int> arr = [5, 2, 8, 1, 9];
  arr.sort(); // 'sort': sắp xếp phần tử trong list theo thứ tự tăng dần
  print('List sau khi sắp xếp tăng dần: $arr');
  // nếu muốn sắp xếp giảm dần thì dùng: arr.sort((a, b) => b.compareTo(a));

  Set<String> monhoc = {'Toán', 'Lý', 'Hóa', 'Sinh'};
  Map<String, double> diemHocKy = {'Toán': 8.5,'Lý': 7.5,'Hóa': 9.0,'Văn': 8.0,'Toán' : 9.0 // key trùng sẽ lấy giá trị cuối cùng
  };
  print('điểm học kỳ: $diemHocKy');

  // thêm phần tử trong map
  diemHocKy['Anh'] = 8.8;
  print('điểm học kỳ sau khi thêm: $diemHocKy');
  // sửa phần tử trong map
  diemHocKy['Toán'] = 9.0;
  print('điểm học kỳ sau khi sửa: $diemHocKy');
  // xóa phần tử trong map
  diemHocKy.remove('Văn');
  print('điểm học kỳ sau khi xóa: $diemHocKy');
}
