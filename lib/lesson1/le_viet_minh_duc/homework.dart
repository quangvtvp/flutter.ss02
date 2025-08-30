void main() {
  print('Hello');
  print('Le Viet Minh Duc');
  print('toi thich cau long');
//bai 1
  print('Exercise 1:');
  int age = 15;
  String name = 'Le Viet Minh Duc';
  double height = 1.7;
  print(
      'Hello, my name $name, I am $age years old and my height is $height meter ');
//bai 2
  print('Exercise 2:');
  int number1 = 5;
  int number2 = 10;
  int tong = number1 + number2;
  int hieu = number2 - number1;
  int tich = number1 * number2;
  double thuong = number2 / number1;
  print('Tong = $tong; Hieu = $hieu; Tich = $tich; Thuong = $thuong');
//bai 3
  print('Exercise 3:');
  String hoten = 'Le Viet Minh Duc';
  int tuoi = 15;
  double diemtb = 8.7;
  String gioitinh = 'Nam';
  String mssv = '006258';
  print(
      'Ho ten: $hoten; Tuoi: $tuoi; Diem TB: $diemtb; Gioi tinh: $gioitinh; MSSV: $mssv');
//bai 4
  print('Exercise 4:');
  double chieudai = 5.6;
  double chieurong = 2.4;
  double dientich = chieudai * chieurong;
  double chuvi = (chieudai + chieurong) * 2;
  print('Dien tich hinh chu nhat la: $dientich');
  print('Chu vi hinh chu nhat la: $chuvi');
//bai 5
  print('Exercise 5:');
  double toan = 9.3, ly = 9.2, hoa = 8.5;
  double avg = (toan + ly + hoa) / 3;
  double gpa = avg / 2.5;
  String grade = (gpa == 4.0)
      ? 'A+'
      : (gpa >= 3.6)
          ? 'A'
          : (gpa >= 2.8)
              ? 'B'
              : (gpa >= 2.0)
                  ? 'C'
                  : (gpa >= 1.2)
                      ? 'D'
                      : 'F';
  print('Diem TB = $avg; GPA = $gpa; Diem chu = $grade');
}
