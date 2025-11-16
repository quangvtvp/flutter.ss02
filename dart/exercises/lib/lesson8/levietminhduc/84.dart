class diem {
  String ten;
  double _toan;
  double _ly;
  double _hoa;
  diem(this.ten, this._toan, this._ly, this._hoa);
  bool _kiemtra(double diem1) {
    if (diem1 == null || diem1 < 0 || diem1 > 10) {
      print('Điểm không hợp lệ! Điểm phải từ 0 đến 10.');
      return false;
    }
    return true;
  }
  double _diemtrungbinh() {
    return (_toan + _ly + _hoa) / 3;
  }
  String _xeploai(double diemTB) {
    if (diemTB >= 8.0)
      return 'Giỏi';
    else if (diemTB >= 6.5)
      return 'Khá';
    else if (diemTB >= 5.0)
      return 'Trung bình';
    else
      return 'Yếu';
  }
  void capnhatdiem(String monhoc, double diemmoi) {
    if (!_kiemtra(diemmoi)) {
      return;
    }
    if (monhoc == 'Toán') {
      _toan = diemmoi;
      print('Cập nhật điểm Toán: $_toan');
    } else if (monhoc == 'Lý') {
      _ly = diemmoi;
      print('Cập nhật điểm Lý: $_ly');
    } else if (monhoc == 'Hóa') {
      _hoa = diemmoi;
      print('Cập nhật điểm Hóa: $_hoa');
    } else {
      print('Môn học không hợp lệ!');
    }
  }
  void inthongtin() {
    double diemTB = _diemtrungbinh();
    String xeploai = _xeploai(diemTB);
    print('--- Thông tin học sinh ---');
    print('Tên học sinh: $ten');
    print('Điểm Toán: $_toan');
    print('Điểm Lý: $_ly');
    print('Điểm Hóa: $_hoa');
    print('Điểm trung bình: ${diemTB.toStringAsFixed(2)}');
    print('Xếp loại: $xeploai');
  }
}
void main() {
  var student = diem('Lê Viết Minh Đức', 9.0, 9.5, 8.5);
  student.inthongtin();
  student.capnhatdiem('Toán', 11.0); 
  student.capnhatdiem('Lý', 8.0); 
  student.inthongtin();
}
