import 'dart:io';

class studentGrades {
  double _math;
  double _physic;
  double _chemistry;
  String name;

  studentGrades(this._math, this._physic, this._chemistry, this.name);

  bool _validateScore(double score) => (score >= 0 && score <= 10);

  double calculateAvg() => (_math + _physic + _chemistry) / 3;

  String _getGrade(double avg) {
    String grade = (avg >= 8)
        ? 'Giỏi'
        : (avg >= 6.5)
            ? 'Khá'
            : (avg >= 5)
                ? 'Trung Bình'
                : 'Kém';
    return grade;
  }

  void update(String subject, double Nscore) {
    if (!_validateScore(Nscore)) {
      print('Điểm nhập không hợp lệ, vui lòng kiểm tra lại điểm số.');
      return;
    }
    switch (subject.toLowerCase()) {
      case 'math':
        _math = Nscore;
        print('Đã cập nhật điểm [Toán]: $Nscore');
        break;
      case 'physic':
        _physic = Nscore;
        print('Đã cập nhật điểm [Lý]: $Nscore');
        break;
      case 'chemistry':
        _chemistry = Nscore;
        print('Đã cập nhật điểm [Hóa]: $Nscore');
        break;
      default:
        print('!!! Kiểm tra lại tên môn học !!!');
        break;
    }
  }

  void showReport() {
    print('_______BẢNG ĐIỂM HỌC SINH_______');
    print('Họ và tên: $name');
    print('Điểm Toán: $_math');
    print('Điểm Lý: $_physic');
    print('Điểm Hóa: $_chemistry');
    print('Điểm Trung Bình: ${calculateAvg()}');
    print('Xếp Loại: ${_getGrade(calculateAvg())}');
  }
}

void main() {
  studentGrades student = studentGrades(9.5, 9.0, 8.5, 'Phạm Minh Bảo');
  student.showReport();

  print('Cập nhật điểm mới');
  print('------------------');
  print('Nhập tên môn theo tiếnh Anh (math, physic, chemistry)');
  String subject = stdin.readLineSync()!;
  print('Nhập điểm môn ${subject.toLowerCase()}:');
  double Nscore = double.parse(stdin.readLineSync()!);
  student.update(subject, Nscore);

  print('\nBảng điểm sau khi cập nhật:');
  student.showReport();
}
