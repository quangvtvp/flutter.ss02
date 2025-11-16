import 'dart:io';

void main() {
List<String> word = ["xinchao" , "toan" , "lienquan", "toilet"];
word.shuffle();
String words =word[0];
play(words);


}
void play(String word) {
List<String> danhsach =word.split('');
danhsach.shuffle();
var random = danhsach.join();
print(random);
var tu = '';
do {
  stdout.write ('nhap tu ban doan:');
tu = stdin.readLineSync() ?? '';
if ( tu.toLowerCase() == word.toLowerCase() ) {
  print('ban da doan dung'); }
  else {
    print('ban da doan sai, vui long doan lai');}
   } while (tu.toLowerCase() !=word.toLowerCase() );
}

