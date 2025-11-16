# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Trần Hữu Gia Bảo  
**Ngày sinh:** 29-07-2009  
**Trường:** THPT Lương Ngọc Quyến  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 30/45      | 45          | 66.6%     |
| **Bài 2: Main Program** | 17/45      | 45          | 37.7%     |
| **Bonus**               | 2/10       | 10          | 10%       |
| **TỔNG CỘNG**           | **47/90**  | **90**      |  |
| **TỔNG SAU BONUS**      | **49/100** | **100**     | **49%**   |

**Xếp loại:** 📝 **Chưa đạt - Cần cố gắng thêm**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (30/45 điểm)

**1. Properties (10/10 điểm)** - Có đủ 5 properties

- 💭 Tên class `sach` nên là `Book` (viết hoa)

**2. Constructor (10/10 điểm)** - Tốt!

**3. Methods cơ bản (4/10 điểm)**

- ⚠️ **SAI LOGIC:** Methods `borrowBook()` và `returnBook()` đang nhận parameter `sach book` - không đúng
- 💭 Đề bài: Methods không cần parameter, chỉ thay đổi `isAvailable` của chính object đó
- 💭 Em đang viết: `void borrowBook(sach book)` - SAI
- 💭 Đúng: `void borrow()`

**4. Method getInfo() (4/8 điểm)** - Chưa có

- ❌ Em không có method `getInfo()` trong class
- 💭 Em đang print thủ công trong main

**5. Method isOldBook() (2/5 điểm)** - Chưa có

- ❌ Em không có method `isOldBook()` trong class
- 💭 Em đang check thủ công: `bool isoldBook = book1.publishYear < 1950;`

---

### BÀI 2: MAIN PROGRAM (17/45 điểm)

#### ⚠️ **KHÔNG SỬ DỤNG CLASS:**

Em đang dùng nhiều List riêng thay vì `List<Book>`.

**1. Khởi tạo (0/5 điểm)** - Không dùng List<Book>

**2. In danh sách (8/10 điểm)**

- ✅ Em có in thông tin
- ❌ Không dùng class

**3. Thống kê (4/10 điểm)**

- ✅ In tổng số sách
- ❌ Chưa mượn/trả đúng yêu cầu

**4. Tìm đắt nhất (5/10 điểm)**

- ✅ Em dùng `prices.sort()` và `prices.last` - hay!
- ❌ Nhưng chưa hiển thị đúng cuốn sách (chỉ in giá)

**5. Tìm theo tác giả (0/10 điểm)** - Chưa làm

**6. Test code (2/0 điểm)** - Em có test trong book.dart

---

## GỢI Ý SỬA 💡

**SỬA CLASS:**

```dart
class Book { // Đổi từ 'sach' thành 'Book'
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable;

  Book(this.title, this.author, this.publishYear, this.price, this.isAvailable);

  // Sửa: Không cần parameter
  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }

  // Thêm method getInfo
  String getInfo() {
    String status = isAvailable ? 'Có sẵn' : 'Đã mượn';
    return 'Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: ${price}đ, Trạng thái: $status';
  }

  // Thêm method isOldBook
  bool isOldBook() {
    return publishYear < 1950;
  }
}
```

**LÀM LẠI MAIN:**

```dart
void main() {
  List<Book> books = [
    Book('Dế Mèn Phiêu Lưu Ký', 'Tô Hoài', 1941, 45000, true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false),
    // ... 8 cuốn còn lại
  ];

  // Sử dụng books[i].getInfo()
  for (int i = 0; i < books.length; i++) {
    print('${i+1}. ${books[i].getInfo()}');
  }
}
```

---

## KẾT LUẬN 🎯

### 💪 Điểm mạnh:

- ✅ Em biết dùng `sort()` và `last` - hay!
- ✅ Em có test code
- ✅ Em có ý tưởng logic

### 🌱 Cần cải thiện:

- 📚 Phải dùng `List<Book>` theo yêu cầu
- 🔍 Thêm đầy đủ methods vào class
- 💡 Sửa logic methods (không cần parameter)
- ⚡ Làm đầy đủ tất cả yêu cầu

---

**Nhận xét:** Em cần làm lại theo đúng OOP: tạo class đầy đủ methods và sử dụng List<Book>.
- Em có ý tưởng tốt nhưng chưa làm đúng yêu cầu
- Nếu làm đúng theo đề bài, em sẽ đạt 70+ điểm
- Cố lên em! 💪
