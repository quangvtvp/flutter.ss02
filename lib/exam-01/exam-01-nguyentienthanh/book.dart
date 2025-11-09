void main(){
 var book1 = book('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 10.99, true);
 print(book1.getBookInfo());
 book1.borrowBook();
 print(book1.getBookInfo());
 print(book1.isOldBook());
}
class book {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable;
  book( this.title, this.author,  this.publishYear, this.price,  this.isAvailable);
  void borrowBook(){
    if(isAvailable){
      isAvailable = false;
      print('you have borrowed the book: $title');}
      void returnBook(){
       isAvailable = true;
       print('You have returned the book: $title');
       String getBookInfo(){
        return 'Title: $title, Author: $author, Publish Year: $publishYear, Price: $price, Available: $isAvailable';
        bool isOldBook(){
        return publishYear < 1950;
        }

       }
      }

    }
  }