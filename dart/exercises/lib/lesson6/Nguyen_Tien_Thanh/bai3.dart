void main(){
  List<int> diem = [8,6,9,7,10,5];
  List<int> soChiaHetCho5 = diem.where((d)=> d%5 == 0).toList();
  print('các diểm chia hết cho 5 : $soChiaHetCho5');
}