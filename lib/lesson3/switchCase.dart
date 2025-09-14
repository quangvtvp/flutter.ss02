void main(List<String> args) {
  int dayInWeek = 3;

  switch (dayInWeek) {
    case 1:
      print('Thứ hai');
      break;
    case 2:
      print('Thứ ba');
      break;
    case 3:
      print('Thứ tư');
      break;
    case 4:
      print('Thứ năm');
      break;
    case 5:
      print('Thứ sáu');
      break;
    case 6:
      print('Thứ bảy');
      break;
    case 7:
      print('Chủ nhật');
      break;
    default:
      print('Ngày trong tuần không hợp lệ!');
  }
}
