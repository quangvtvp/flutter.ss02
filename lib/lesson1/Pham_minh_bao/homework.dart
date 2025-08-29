void main() {
//team name: --> string
  String team1 = "the sun";
  String team2 = "tinh tế";

//teams' score --> int
  int team1_score = 600;
  int team2_score = 700;

//playing
  team1_score = team1_score + 200;

//is_team_win --> bool
  bool is_team1_win = team1_score > team2_score; //trả lại giá trị true/false
  bool is_team2_win = team2_score > team1_score;

  print('team 1 win: $is_team1_win');
  print('team 2 win: $is_team2_win'); //"$" là hiện giá trị của biến
  print('team 1 đạt được: $team1_score');
  print('team 2 đạt được: $team2_score');
  print(
      'team 2 hơn team 1: ${team2_score - team1_score} điểm'); //"{}" dùng để nhóm các công thức tính toán

  var team2leader = "Uyen Nhi"; // "var" để xác định kiểu dữ liệu của biến
  const double pi = 3.14; // "const" để xác định hằng số
  final double radius = 2.5; // "final" để xác định kiểu dữ liệu của biến

  var number = 31;
  print('${number % 6}'); // "%" chia lấy phần dư
  print('${number ~/ 6}'); // "~/" chia lấy phần nguyên

  print('${number % 2}'); // nếu khác 0 --> số lẻ
// nếu ${number % 2} = 0 --> số chẵn. Ngược lại --> số lẻ

// bài toán xác định số chẵn lẻ
  if (number % 2 == 0) {
    // nếu True --> trả về số chẵn
    print('$number là số chẵn');
  } else {
    // nếu False --> trả về số lẻ
    print('$number là số lẻ');
  }
} 
