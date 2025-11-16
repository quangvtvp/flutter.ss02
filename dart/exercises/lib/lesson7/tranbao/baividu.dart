main() {
  printSachsUsingMap();
}

void printSachsUsingMap() {
  var mapsach = [
    {'tacgia': 'tacgia:tacgia1', 'monhoc': 'monhoc:toan', 'tensach': 'tensach:tensach1', 'sotrang': 'sotrang:sotrang1'},
    {'tacgia': 'tacgia:tacgia2', 'monhoc': 'monhoc:ly', 'tensach': 'tensach:tensach2', 'sotrang': 'sotrang:sotrang2'},
    {'tacgia': 'tacgia:tacgia3', 'monhoc': 'monhoc:hoa', 'tensach': 'tensach:tensach3', 'sotrang': 'sotrang:sotrang3'},
    {'tacgia': 'tacgia:tacgia4', 'monhoc': 'monhoc:sinh', 'tensach': 'tensach:tensach4', 'sotrang': 'sotrang:sotrang4'},

  ];

  for (int i = 0; i < mapsach.length; i++) {
    print('${i + 1}: ${mapsach[i]['tacgia']} ${mapsach[i]['monhoc']} ${mapsach[i]['tensach']} ${mapsach[i]['sotrang']} ');
  }
}
