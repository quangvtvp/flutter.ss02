void main(List<String> args) {
  // team1Score
  var randNumber = 31;
  print('${randNumber % 6}');
  print('${randNumber ~/ 6}');
  print('${randNumber % 2}'); // khác 0 > số lẻ, trả về 0 thì số chắn
  // Nếu ${randNumber % 2} = 0 > in ra chữ SỐ CHẴN nếu không > in ra SỐ LẺ
  if (randNumber % 2 == 0) {
    print('SỐ CHẴN');
  } else {
    print('SỐ LẺ');
  }

  print('${20 <= 21}');
  print('${randNumber % 2 == 0 ? 'SỐ CHẴN' : 'SỐ LẺ'}');
}
