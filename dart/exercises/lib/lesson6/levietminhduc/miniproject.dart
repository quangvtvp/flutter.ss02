void main() {
  print('In thông tin và sở thích của mỗi người trong nhóm:');
  List<Map<String, dynamic>> groupMembers = [
    {
      'name': 'Lê Viết Minh Đức',
      'hobby': ['chơi game', 'cầu lông'],
    },
    {
      'name': 'Nguyễn Viết Thức',
      'hobby': ['xem phim', 'du lịch'],
    },
    {
      'name': 'Trần Anh Toàn',
      'hobby': ['bóng đá', 'làm toán'],
    },
    {
      'name': 'Trần Hữu Gia Bảo',
      'hobby': ['thể thao điện tử'],
    },
    {
      'name': 'Phạm Văn Dương',
      'hobby': ['chơi game', 'đọc sách'],
    },
  ];
  groupMembers.forEach((member) {;
    print('Sở thích của ${member['name']} là: ${member['hobby']}');
  });
  groupMembers.add({
    'name': 123,
    'hobby': ['chơi game', 'đọc sách'],
  });
  print('Danh sách nhóm sau khi thêm thành viên mới: $groupMembers');
  print('name; ${groupMembers[5]['name']}');
  print('hobby; ${groupMembers[5]['hobby']}');
}
