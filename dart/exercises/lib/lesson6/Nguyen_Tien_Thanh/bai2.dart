void main(){
 List<int> diemSo = [8,7,5,9,10];
 int diemCaoNhat = diemSo[0];
 int diemThapNhat = diemSo[0];
 for(var diem in diemSo){
   if(diem>diemCaoNhat){
      diemCaoNhat=diem;
   }
   if(diem<diemThapNhat){
      diemThapNhat=diem;
   }
}
print('Điểm Cao Nhất : $diemCaoNhat');
print('Điểm Thấp Nhất: $diemThapNhat');
diemSo.add(6);
int tongDiem = 0 ;
for (var diem in diemSo){
  tongDiem+=diem;
}
}