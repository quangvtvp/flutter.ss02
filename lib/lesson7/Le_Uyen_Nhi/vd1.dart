main() {
  printsachhocsinh();
}

void printsachhocsinh() {
  var mapsach = [
    {
      'tacgia': 'Nguyen Van A',
      'monhoc': 'toan',
      'lop 11': 'sgk toan ',
      'sotrang': '130'
    },
    {
      'tacgia': 'Nguyen Van B',
      'monhoc': 'ly',
      'lop 11 ': 'sgk ly',
      'sotrang': '120'
    },
  ];

  for (int i = 0; i < mapsach.length; i++) {
    print(
        '${i + 1}: ${mapsach[i]['tacgia']} ${mapsach[i]['monhoc']} ${mapsach[i]['lop 11']} ${mapsach[i]['sotrang']} ');
  }
}
