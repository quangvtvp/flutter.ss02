void main() {
  List<String> baihat = [
    'Từng ngày yêu em',
    'Vườn mây vừa hay',
    'Dù cho mai về sau',
    'Love Game',
    'Giờ thì',
  ];
  baihat.sort();
  print('Danh sách bài hát đã sắp xếp: $baihat');
  baihat.forEach(print);
  var dai = baihat.where((bai) => bai.length > 10).toList();
  print('Danh sách bài hát có độ dài lớn hơn 10 ký tự : $dai ');
}
