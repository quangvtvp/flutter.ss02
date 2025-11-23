class student {
  String? name;
  int? year;

  student(this.name, this.year);

  student.k8(String namee) {
    // year cố định, chỉ cần nhập name
    name = namee;
    year = 2008;
  }

  student.k9(String namee) {
    name = namee;
    year = 2009;
  }

  void show() {
    print('ho va ten: $name, nam sinh: $year');
  }
}

class hs {
  String? ten;
  int? lop;
  double? diem;

  hs({required this.ten, required this.lop, this.diem = 0.0});
  // dấu ngoặc nhọn {} --> yêu cầu nhập tên thuộc tính
  // this.diem = 0.0 --> có thể nhập thuộc tính hoặc không, nếu không điền sẽ tự động hiểu là = 0.0

  void abc() {
    print('$ten \t|$lop \t|$diem');
  }
}

void main() {
  student hs1 = student('ABC', 2007);
  student hs2 = student.k8('XYZ');
  student hs3 = student.k9('GHI');

  hs1.show();
  hs2.show();
  hs3.show();

  hs hs4 = hs(ten: 'Phạm Minh Bảo', lop: 11);
  hs hs5 = hs(ten: 'Phạm Minh Bảo', lop: 11, diem: 10);
  hs4.abc();
  hs5.abc();
  
}

// thêm dấu gạch dưới "_" vào trước => biến private (riêng tư) tức không thể sử dụng trong các file khác
// hàm được bảo mật