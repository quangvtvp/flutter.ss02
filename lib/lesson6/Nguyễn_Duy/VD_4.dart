void main() {
  var listname = ['genyukiko', 'Nguyễn Duy', 'GenYuki'];
  for (var name in listname) {
    var name2 = {
      'hoppy 1': 'chơi game',
      'hoppy 2': 'xem phim',
      'hoppy 3': 'nghe nhạc'
    };
    var hoppy = name2.values.toList();
    print('Sở thích của $name là: $hoppy');
    print('                                        ');
  }
}
