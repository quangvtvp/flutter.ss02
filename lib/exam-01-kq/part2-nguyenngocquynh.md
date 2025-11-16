# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Nguyễn Ngọc Quỳnh  
**Ngày sinh:** 30-12-2009  
**Trường:** THPT Lương Ngọc Quyến  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 21/45      | 45          | 46.6%     |
| **Bài 2: Main Program** | 14/45       | 45          | 31.1%     |
| **Bonus**               | 2/10       | 10          | 20%        |
| **TỔNG CỘNG**           | **35/90**  | **90**      | |
| **TỔNG SAU BONUS**      | **37/100** | **100**     | **37%**   |

**Xếp loại:** 📝 **Chưa đạt - Cần cố gắng nhiều hơn**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (21/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class Book với đầy đủ 5 properties
2. 👍 Constructor hoạt động tốt
3. 💪 Em biết cách khởi tạo objects

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu

**2. Constructor (10/10 điểm)** - Tốt! 🎯

- ✅ Constructor hoạt động chính xác
- ✅ Sử dụng positional parameters

**3. Methods cơ bản (0/10 điểm)** - Chưa làm

- ❌ Em chưa có methods `borrow()` và `returnBook()` trong class
- 💭 Thầy gợi ý thêm:

  ```dart
  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }
  ```

**4. Method getInfo() (0/8 điểm)** - Chưa làm

- ❌ Em chưa có method `getInfo()` trong class
- 💭 Thầy gợi ý thêm:
  ```dart
  String getInfo() {
    String status = isAvailable ? 'Có sẵn' : 'Đã mượn';
    return 'Tên: $title, Tác giả: $author, Năm: $publicationYear, Giá: ${price}đ, Trạng thái: $status';
  }
  ```

**5. Method isOldBook() (0/5 điểm)** - Chưa làm

- ❌ Em chưa có method `isOldBook()`
- 💭 Thầy gợi ý thêm:
  ```dart
  bool isOldBook() {
    return publicationYear < 1950;
  }
  ```

**6. Code quality (1/2 điểm bonus)**

- 💭 Em cần thêm các methods cần thiết

---

### BÀI 2: MAIN PROGRAM (14/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👍 Em đã tạo được List và biết cách add books vào
2. 💪 Em biết cách sử dụng vòng lặp

#### 💡 Gợi ý để em hoàn thiện:

**1. Khởi tạo List sách (3/5 điểm)** - Cần cải thiện

- ⚠️ Em chỉ tạo 5 cuốn sách, đề bài yêu cầu 10 cuốn
- ⚠️ Một số thông tin sai: "Tắt đèn" là 1939, giá 52000, isAvailable ban đầu là false
- 💭 Em cần thêm 5 cuốn còn thiếu:
  - Nhà giả kim (Paulo Coelho, 1988, 89000)
  - Đắc nhân tâm (Dale Carnegie, 1936, 95000)
  - Tuổi trẻ đáng giá bao nhiêu (Rosie Nguyễn, 2018, 78000)
  - Cây cam ngọt của tôi (José Mauro de Vasconcelos, 1968, 105000)
  - Sapiens (Yuval Noah Harari, 2011, 198000)

**2. In danh sách sách (6/10 điểm)** - Cần cải thiện

- ✅ Em có in danh sách
- 💭 Nên thêm số thứ tự và format đẹp hơn

**3. Thống kê (2/10 điểm)** - Chưa làm đúng

- ⚠️ Logic mượn sách của em chưa đúng (đang set tất cả sách thành available = true)
- ❌ Chưa mượn đúng "Nhà giả kim" và "Số đỏ"
- ❌ Chưa trả "Tắt đèn"
- ❌ Chưa đếm số sách có sẵn/đã mượn

**4. Tìm sách đắt nhất (0/10 điểm)** - Chưa làm

**5. Tìm sách theo tác giả (0/10 điểm)** - Chưa làm

**6. File main.dart riêng (3/0 điểm bonus nhỏ)**

- ✅ Em có tạo file main.dart riêng nhưng code chưa hoàn chỉnh

---

## BONUS (2/10 điểm)

- 💭 Em cần hoàn thiện code trước

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Có cố gắng:** Em đã cố gắng làm bài
2. 💪 **Biết cơ bản:** Em biết cách tạo class và object
3. 📝 **Có ý tưởng:** Em có ý tưởng về mượn sách qua stdin

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Em cần hoàn thiện:

**1. Thêm đầy đủ methods vào Class Book:**

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

**2. Tạo đủ 10 cuốn sách theo đề bài**

**3. Thực hiện đầy đủ các yêu cầu:**

- In danh sách với số thứ tự
- Mượn "Nhà giả kim" và "Số đỏ"
- Trả "Tắt đèn"
- Đếm và in số sách có sẵn/đã mượn
- Tìm sách đắt nhất
- Tìm sách của "Nam Cao"
- Đếm sách cổ (trước 1950)

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em biết cách tạo class và object
- ✅ Em biết cách sử dụng List
- ✅ Em có ý tưởng về logic

### 🌱 Hướng phát triển:

- 📚 Em cần đọc kỹ đề bài và làm đầy đủ tất cả yêu cầu
- 🔍 Em cần thêm đầy đủ methods vào class
- 🎨 Em cần tạo đủ 10 cuốn sách
- ⚡ Em cần hoàn thiện logic mượn/trả sách
- 💡 Em cần thực hiện đầy đủ các chức năng còn thiếu

---

**Nhận xét chung:** Em cần cố gắng nhiều hơn trong việc đọc và hiểu đề bài, cũng như hoàn thiện đầy đủ các yêu cầu. Em đã có nền tảng về OOP, hãy tiếp tục học và thực hành thêm nhé! 💪
