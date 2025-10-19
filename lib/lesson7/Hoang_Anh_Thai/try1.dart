// ignore: file_names
void main() {
  var maphocsinh = [
    {
      'tacgia': 'Nguyen van A',
      'monhoc': 'Toan',
      'tensach': 'Giai tich 12',
      'sotrang': 500
    },
    {
      'tacgia': 'Tran thi B',
      'monhoc': 'Ly',
      'tensach': 'Vat ly 12',
      'sotrang': 450
    },
    {
      'tacgia': 'Le van C',
      'monhoc': 'Hoa',
      'tensach': 'Hoa hoc 12',
      'sotrang': 400
    },
    {
      'tacgia': 'Pham thi D',
      'monhoc': 'Sinh',
      'tensach': 'Sinh hoc 12',
      'sotrang': 350
    },
  ];
  for (int i = 0; i < maphocsinh.length; i++) {
    print(
        '${i + 1}: ${maphocsinh[i]['tacgia']} - ${maphocsinh[i]['monhoc']} - ${maphocsinh[i]['tensach']} - ${maphocsinh[i]['sotrang']}');
  }
}
