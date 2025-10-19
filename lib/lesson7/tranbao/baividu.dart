main() {
  printSachsUsingMap();
}

void printSachsUsingMap() {
  var mapsach = [
    {'tacgia': 'tacgia1', 'monhoc': 'toan', 'tensach': 'tensach1', 'sotrang': 'sotrang1'}, 
    {'tacgia': 'tacgia2', 'monhoc': 'ly', 'tensach': 'tensach2', 'sotrang': 'sotrang2'}, 
    {'tacgia': 'tacgia3', 'monhoc': 'hoa', 'tensach': 'tensach3', 'sotrang': 'sotrang3'}, 
    {'tacgia': 'tacgia4', 'monhoc': 'van', 'tensach': 'tensach4', 'sotrang': 'sotrang4'},
  ];

  for (int i = 0; i < mapsach.length; i++) {
    print('${i + 1}: ${mapsach[i]['tacgia']} ${mapsach[i]['monhoc']} ${mapsach[i]['tensach']} ${mapsach[i]['sotrang']} ');
  }
}
