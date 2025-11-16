class car  {
  String? brand;
  int? year;
  String? price;
  car(this.brand ,this.year ,this.price);
void showinfo(){
  print ('brand: $brand year: $year price: $price trieu dong');
}
}
void main(){
  var c1= car( 'A', 2009,'300'  );
  var c2= car( 'B', 2010,'400'  );
  var c3= car( 'C', 2011,'500'  );  
  c1.showinfo();
  c2.showinfo();
  c3.showinfo();
}