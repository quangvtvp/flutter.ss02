void main() {
  var sach = [
    {
      'tacgia': 'Lê Văn Tuấn',
      'monhoc': 'toán',
      'tensach': 'Nền tảng toán học',
      'sotrang': 382
    },
  ];
  for (var i in sach) {
    [
      print(
          'Tác giả: ${i['tacgia']}, Môn học: ${i['monhoc']}, Tên sách: ${i['tensach']}, Số trang: ${i['sotrang']}')
    ];
  }
}
