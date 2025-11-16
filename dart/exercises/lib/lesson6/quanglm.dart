void main() {
//   Bài tập:
// - Khai báo danh sách thông tin sở thích của lớp, mỗi người sẽ có các thông tin sau:
//  - Name
//  - Hobby

//  ## ví dụ:
//   1. Name: Hoàng Anh Thái
//       Hobby: Chơi game, Xem phim, Nghe nhạc
//   2. Name: Quang
//       Hobby: Chơi game, Xem phim, Nghe nhạc
//   3. Name: Minh
//       Hobby: Chụp ảnh, Chơi thể thao, Cắm trại
  // khai báo list map sở thích cá nhân, bao gồm name, danh sách hobby
  List<Map<String, dynamic>> teams = [
    {
      'name': 'Thái',
      'hobby': ['Chơi game', 'Xem phim', 'Nghe nhạc']
    },
    {
      'name': 'Lan',
      'hobby': ['Du lịch', 'Nấu ăn', 'Đọc sách']
    },
    {
      'name': 'Minh',
      'hobby': ['Chụp ảnh', 'Chơi thể thao', 'Cắm trại']
    },
  ];

  // print('name: ${teams[1]['name']}');

  for (var person in teams) {
    print('Sở thích của ${person['name']}: ${person['hobby'].join(', ')}');
  }

  // tìm người có sở thích "Chơi game"
  String searchHobby = 'Chơi game';
  var foundPerson = teams.firstWhere((person) => (person['hobby'] as List<String>).contains(searchHobby), orElse: () => {});
  if (foundPerson.isNotEmpty) {
    print('Người có sở thích "$searchHobby" là: ${foundPerson['name']}');
  } else {
    print('Không tìm thấy người có sở thích "$searchHobby".');
  }
}
