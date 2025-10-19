void main() {
  List<String> baihat = [
    'Lần cuối',
    'Cho tôi đi theo',
    'Cho zôi đi theo',
    'Thấy chưa',
    'Điểm đến cuối cùng',
  ];
  for (int i = 0; i < baihat.length; i++) {
    int? chu1 = (baihat[i]).codeUnitAt(0);
    for (int j = i + 1; j < baihat.length; j++) {
      int? chu2 = (baihat[j]).codeUnitAt(0);
      if (chu1 > chu2) {
        String temp = baihat[i];
        baihat[i] = baihat[j];
        baihat[j] = temp;
      }
    }
  }
  print('Danh sách các bài hát là: $baihat');
  print('Bài hát có số kí tự lớn hơn 10 là: ');
  for (int i = 0; i < baihat.length; i++) {
    if (baihat[i].length > 10) {
      print(baihat[i]);
    }
  }
}
