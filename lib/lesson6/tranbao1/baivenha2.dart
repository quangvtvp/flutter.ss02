void main() {
  List<String> baihatyeuthich = ['baihat1', 'baihat22', 'baihat333', 'baihat4444', 'baihat55555'];
  baihatyeuthich.where((baihat) => baihat.length < 10).forEach((baihat) {
    print(baihat);
  });
}