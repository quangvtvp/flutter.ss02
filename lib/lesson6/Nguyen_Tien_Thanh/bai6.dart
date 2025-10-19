void main() {
  // Tạo danh sách bài hát yêu thích
  List<String> baiHatYeuThich = [
    'Chạy ngay đi',
    'Em của ngày hôm qua',
    'Nơi này có anh',
    'Lạc trôi',
    'Có chàng trai viết lên cây'
  ];

  // Sắp xếp theo thứ tự alphabet
  baiHatYeuThich.sort();
  print('Danh sách sau khi sắp xếp:');
  baiHatYeuThich.forEach(print);

  // Lọc ra các bài hát có tên dài >= 10 ký tự
  var baiHatDai = baiHatYeuThich.where((baiHat) => baiHat.length >= 10);
  print('\nCác bài hát có tên dài >= 10 ký tự:');
  baiHatDai.forEach(print);
}