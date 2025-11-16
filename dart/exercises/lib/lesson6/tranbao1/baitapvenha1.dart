void main() {
  List<String> tienchitieu = ['tienan', 'tiendichuyen', 'tienxang', 'tienmua'];
  List<int> giatien = [10000, 20000, 15000, 30000];
giatien.sort();
  for (int i = 0; i < tienchitieu.length; i++) {
    print('${tienchitieu[i]}: ${giatien[i]}');
  }
  int tongtien = giatien.reduce((a, b) => a + b);
  print('Tổng tiền chi tiêu: $tongtien');
}