// Bài tập 2: Danh sách yêu thích
// Tạo một List<String> chứa 5 bài hát yêu thích.
// Sắp xếp theo thứ tự alphabet.
// Sử dụng where để lọc ra các bài hát có tên dài >= 10 ký tự.


void main() {
  List<String> nhac = [
    'I wish you love',
    'Stranger',
    'This is for',
    'My love by my side',
    'Bui hoa giay'
  ];
  nhac.sort();
  print('danh sách nhạc đã sắp xếp theo alphalbet: $nhac');
  List<String> loc = nhac.where((n) => n.length >= 10).toList();
  print('danh sách các bài hát có tên dài hơn 10 kí tự là: $loc');
}
