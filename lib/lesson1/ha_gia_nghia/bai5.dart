void main() {
    double d1 = 9;
  double d2 = 7.3;
  double d3 = 9.6;
  double avg =(d2+d2+d3)/3;
  double gpa = avg/2.5;
  String phanloai = gpa >= 3.9 ? 'A'
  : gpa >= 3.5 ? 'B' : gpa >= 3 ? 'C' 
  : gpa >= 2.5 ? 'D' : gpa >= 2 ? 'E' : 'F';
  print('GPA =${gpa.toStringAsFixed(2)} , phan loai = $phanloai');
}