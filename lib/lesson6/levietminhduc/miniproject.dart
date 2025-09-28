void main() {
  print('In thông tin và sở thích của mỗi người trong nhóm:');
  List<Map<String, String>> groupMembers = [
    {
      'name': 'Lê Viết Minh Đức',
      'hobby': 'chơi game, cầu lông',
    },
    {
      'name': 'Nguyễn Viết Thức',
      'hobby': 'xem phim, du lịch',
    },
    {
      'name': 'Trần Anh Toàn',
      'hobby': 'bóng đá, làm toán',
    },
    {
      'name': 'Trần Hữu Gia Bảo',
      'hobby': 'thể thao điện tử',
    },
    {
      'name': 'Phạm Văn Dương',
      'hobby': 'chơi game, đọc sách',
    },
  ];
  groupMembers.forEach((member) {;
    print('Sở thích của ${member['name']} là: ${member['hobby']}');
  });
}
