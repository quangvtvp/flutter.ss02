void main() {
  List<String> baihat = [
    ' Hong Nhan',
    'Duong toi cho em ve',
    'Noi nay co anh',
    'Khong thoi gian',
    ' Shape of you'
  ];
  baihat.sort();
  print('Danh sach bai hat: ');
  print(baihat);

  List<String> tendai = baihat.where((d) => d.length >= 10).toList();
  print('Bai hat co ten dai tu 10 ky tutro len: ');
  print(tendai);
}
