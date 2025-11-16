# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Phạm Văn Dương  
**Ngày sinh:** 27-12-2009  
**Trường:** THPT Lương Ngọc Quyến  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 39/45      | 45          | 86.7%     |
| **Bài 2: Main Program** | 19/45      | 45          | 42.2%     |
| **Bonus**               | 2/10       | 10          | 20%       |
| **TỔNG CỘNG**           | **60/90**  | **90**      |  |
| **TỔNG SAU BONUS**      | **62/100** | **100**     | **62%**   |

**Xếp loại:** 📝 **Chưa đạt - Cần cố gắng thêm**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (39/45 điểm)

**1. Properties (9/10 điểm)**

- ✅ Có đủ 5 properties
- 💭 `PublishYear` nên là `publishYear` (chữ p thường)

**2. Constructor (10/10 điểm)** - Tốt!

**3. Methods cơ bản (10/10 điểm)**

- ✅ Có `borrow()` và `returnBook()`
- 💭 Không cần print trong methods theo đề bài

**4. Method getInfo() (7/8 điểm)**

- ✅ Return String đúng
- ⚠️ Em dùng `return (...)` - không cần dấu ngoặc

**5. Method isOldBook() (3/5 điểm)**

- ⚠️ **SAI:** Em đang check `< 2000` thay vì `< 1950`
- 💭 Đề bài yêu cầu: sách cổ là trước 1950

---

### BÀI 2: MAIN PROGRAM (12/45 điểm)

#### ⚠️ **KHÔNG SỬ DỤNG CLASS BOOK:**

Em đang dùng nhiều List riêng biệt thay vì `List<Book>`:

- `List<String> books` - tên sách
- `List<String> authors` - tác giả
- `List<int> publishYears` - năm
- `List<double> prices` - giá
- `List<bool> availabilities` - trạng thái

**Đề bài yêu cầu:** Tạo `List<Book>` với 10 objects

**1. Khởi tạo (0/5 điểm)** - Không dùng List<Book>

**2. In danh sách (10/10 điểm)**

- ✅ Em có in thông tin
- ❌ Không dùng class Book

**3. Thống kê (4/10 điểm)**

- ✅ In tổng số sách
- ❌ Chưa mượn/trả sách

**4. Tìm đắt nhất (3/10 điểm)**

- ✅ Em có logic tìm max
- ⚠️ Có lỗi: `break` ngay sau if nên chỉ check 1 lần

**5. Tìm theo tác giả (0/10 điểm)** - Chưa làm

**6. Logic (2/10 điểm)** - Em có ý tưởng tách functions

---

## GỢI Ý SỬA 💡

**EM CẦN LÀM LẠI MAIN.DART:**

```dart
import 'book.dart';

void main() {
  // Tạo List<Book> thay vì nhiều List riêng
  List<Book> books = [
    Book('Dế mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false),
    // ... 8 cuốn còn lại
  ];

  // In danh sách
  for (int i = 0; i < books.length; i++) {
    print('${i+1}. ${books[i].getInfo()}');
  }

  // Thống kê
  books[5].borrow(); // Nhà giả kim
  books[2].borrow(); // Số đỏ
  books[1].returnBook(); // Tắt đèn

  // ... tiếp tục
}
```

**SỬA isOldBook():**

```dart
bool isOldBook() {
  return PublishYear < 1950; // Sửa từ 2000 thành 1950
}
```

---

## KẾT LUẬN 🎯

### 💪 Điểm mạnh:

- ✅ Em biết cách tạo class
- ✅ Em biết cách tách functions
- ✅ Em có ý tưởng logic tốt

### 🌱 Cần cải thiện:

- 📚 Đọc kỹ đề bài: Phải dùng `List<Book>`
- 🔍 Sửa isOldBook: < 1950 chứ không phải < 2000
- 💡 Làm đầy đủ các yêu cầu còn thiếu

### 💡 Lời thầy:

- Em đạt **38/100 điểm**


---

**Nhận xét:** Em cần làm lại theo đúng yêu cầu đề bài: sử dụng class Book và List<Book>.
- Em làm theo hướng khác (không dùng class) nên mất nhiều điểm
- Với việc dùng đúng `List<Book>`, em sẽ đạt 30+ điểm
- Cố lên em! 💪
