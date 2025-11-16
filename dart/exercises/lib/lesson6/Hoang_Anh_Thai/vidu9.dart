void main() {
  List<String> baihat = [
    'Lần cuối',
    'Cho tôi đi theo',
    'Cho zôi đi theo',
    'Thấy chưa',
    'Điểm đến cuối cùng',
  ];
  List<int> a = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];
  List<String> baihat2 = baihat.where((d) => d == 'Lần cuối').toList();
  List<int> a2 = a.where((d) => d % 5 == 0).toList();
  print(baihat2);
  print(a2);
}
