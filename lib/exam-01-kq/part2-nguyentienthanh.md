# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Nguyễn Tiến Thành  
**Ngày sinh:** 15-10-2009  
**Trường:** THPT Đại Từ  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 19/45      | 45          | 22.2%     |
| **Bài 2: Main Program** | 13/45       | 45          | 15.6%     |
| **Bonus**               | 0/10       | 10          | 0%        |
| **TỔNG CỘNG**           | **32/90**  | **90**      |  |
| **TỔNG SAU BONUS**      | **32/100** | **100**     | **32%**   |

**Xếp loại:** 📝 **Chưa đạt - Cần nộp lại**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (19/45 điểm)

#### ⚠️ **LỖI NGHIÊM TRỌNG - CODE KHÔNG CHẠY ĐƯỢC:**

- ❌ **Lỗi cú pháp:** Dấu ngoặc nhọn `{}` bị sai hoàn toàn
- ❌ Methods `returnBook()`, `getBookInfo()`, `isOldBook()` đang nằm TRONG method `borrowBook()` - SAI
- ❌ Code này không thể compile được

**1. Properties (10/10 điểm)** - Có đủ properties

**2. Constructor (5/10 điểm)** - Code không chạy được do lỗi cú pháp

**3. Methods cơ bản (2/10 điểm)** - Lỗi cú pháp

**4. Method getInfo() (2/8 điểm)** - Lỗi cú pháp

**5. Method isOldBook() (0/5 điểm)** - Lỗi cú pháp

**6. Code quality (0/2 điểm)** - Code không chạy được

---

### BÀI 2: MAIN PROGRAM (13/45 điểm)

**1. Khởi tạo List sách (5/5 điểm)** - Em có tạo 10 cuốn sách đúng

**2. In danh sách sách (8/10 điểm)** - Em có in nhưng chưa có số thứ tự

**3-5. Các phần còn lại (0/30 điểm)** - Em chưa làm

---

## GỢI Ý SỬA LỖI 💡

**LỖI CỦA EM (book.dart):**

```dart
// SAI - Dấu ngoặc nhọn lồng nhau sai
class book {
  void borrowBook(){
    if(isAvailable){
      isAvailable = false;
      print('...');
      void returnBook(){ // ❌ SAI - nằm trong borrowBook
        ...
        String getBookInfo(){ // ❌ SAI - nằm trong returnBook
          ...
        }
      }
    }
  }
}
```

**ĐÚNG - Thầy gợi ý:**

```dart
class Book {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable;

  Book(this.title, this.author, this.publishYear, this.price, this.isAvailable);

  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }

  String getInfo() {
    String status = isAvailable ? 'Có sẵn' : 'Đã mượn';
    return 'Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: ${price}đ, Trạng thái: $status';
  }

  bool isOldBook() {
    return publishYear < 1950;
  }
}
```

---

## KẾT LUẬN 🎯



---

**Nhận xét:
- Em cần chú ý đến cú pháp dấu ngoặc nhọn `{}`
- Em cần hiểu: Mỗi method phải đóng `}` trước khi khai báo method mới
- Thầy khuyên em làm lại bài này, sửa lỗi cú pháp trước
- Em nên sử dụng code formatter để tự động format code
- Cố lên em! 💪
