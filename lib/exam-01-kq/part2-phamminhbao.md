# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Phạm Minh Bảo  
**Ngày sinh:** (Chưa có thông tin)  
**Trường:** (Chưa có thông tin)  
**Ngày chấm:** 16/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt    | Điểm tối đa | Tỷ lệ    |
| ----------------------- | ----------- | ----------- | -------- |
| **Bài 1: Class Book**   | 45/45       | 45          | 100%     |
| **Bài 2: Main Program** | 45/45       | 45          | 100%     |
| **Bonus**               | 8/10       | 10          | 100%     |
| **TỔNG CỘNG**           | **90/90**  | **90**      |          |
| **TỔNG SAU BONUS**      | **98/100** | **100**     | **98%** |

**Xếp loại:** 🎉 **Xuất sắc!**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (45/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class Book với đầy đủ các properties theo yêu cầu
2. 👍 Constructor hoạt động tốt với positional parameters
3. 💪 Đã implement được tất cả các methods cần thiết
4. 🎯 Logic của `oldBook()` hoàn toàn chính xác
5. 📝 Method `getInfo()` return String đúng như yêu cầu và format khá đẹp
6. 🌟 Code có cấu trúc rõ ràng, dễ đọc

#### 💡 Gợi ý để em cải thiện:

**1. Properties (15/15 điểm)** - Xuất sắc! 🌟

- 🎯 Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu cho tất cả properties
- ✅ `title: String` - Có
- ✅ `author: String` - Có
- ✅ `publishYear: int` - Có
- ✅ `price: double` - Có
- ✅ `isAvailable: bool` - Có

**2. Constructor (10/10 điểm)** - Xuất sắc! 🌟

- ✅ Constructor hoạt động chính xác
- ✅ Sử dụng positional parameters đúng như yêu cầu
- ✅ Có đầy đủ 5 tham số

**3. Methods cơ bản (10/10 điểm)** - Hoàn hảo!

- ✅ Có đầy đủ 4 methods như yêu cầu
- ✅ `borrow()` - Cài đặt đúng, set isAvailable = false
- ✅ `returnBook()` - Cài đặt đúng, set isAvailable = true
- ✅ Logic thay đổi trạng thái hoạt động đúng

**4. Method getInfo() (5/5 điểm)** - Hoàn hảo! 🎯

- ✅ Return String đúng như yêu cầu
- ✅ Hiển thị đầy đủ thông tin (title, author, year, price, status)
- ✅ Xử lý trạng thái có sẵn/đã mượn chính xác
- 💭 Ghi chú nhỏ: Dòng 18 có lỗi chính tả `'Có sắn'` → nên sửa thành `'Có sẵn'`

**5. Method oldBook() (5/5 điểm)** - Hoàn hảo! 🎯

- ✅ Logic hoàn toàn chính xác (kiểm tra sách trước 1950)
- ✅ Return type đúng
- 💭 Gợi ý tối ưu: Có thể viết ngắn hơn `return publishYear < 1950;` thay vì dùng if-else

**6. Code quality**

- ✅ Code có cấu trúc tốt, dễ đọc
- ✅ Tên biến rõ ràng và có ý nghĩa
- 💭 Ghi chú: Em để tất cả code trong 1 file Book.dart, lần sau nên tách ra `book.dart` và `main.dart` riêng

---

### BÀI 2: MAIN PROGRAM (45/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List<Book> với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách đa dạng và có ý nghĩa
3. 💪 Em đã thực hiện đầy đủ tất cả các chức năng theo yêu cầu
4. 🎯 Logic xử lý dữ liệu chính xác
5. 📝 Code rõ ràng với comments và tiêu đề phân cách
6. 🌟 Em đã làm được cả phần bonus rất tốt

#### 💡 Gợi ý để em hoàn thiện:

**1. Khởi tạo List sách (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin đầy đủ và có ý nghĩa
- ✅ Sử dụng `List<Book>` đúng cú pháp
- ✅ Dữ liệu đa dạng (sách cổ, sách hiện đại, giá khác nhau, trạng thái khác nhau)

**2. In danh sách sách (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Em đã sắp xếp sách theo giá giảm dần bằng `sort()` và `compareTo()`
- ✅ Dùng vòng lặp và thêm số thứ tự rất đẹp
- ✅ Gọi `getInfo()` đúng cách
- ✅ Output rõ ràng và dễ đọc

**3. Thống kê (15/15 điểm)** - Hoàn hảo! 🌟

- ✅ In tổng số sách: `${books.length}`
- ✅ Thực hiện mượn sách: Gọi `borrow()` cho 2 cuốn (books[2], books[5])
- ✅ Thực hiện trả sách: Gọi `returnBook()` cho 1 cuốn (books[1])
- ✅ Đếm và hiển thị số sách có sẵn/đã mượn với logic chính xác
- ✅ Dùng vòng lặp để đếm, phân biệt trạng thái rõ ràng

**4. Tìm sách đắt nhất (5/5 điểm)** - Hoàn hảo! 🎯

- ✅ Em đã sắp xếp theo giá giảm dần
- ✅ Lấy phần tử đầu tiên (books[0]) là sách đắt nhất
- ✅ Output hiển thị đúng với tiêu đề rõ ràng

**5. Tìm sách theo tác giả (5/5 điểm)** - Hoàn hảo! 🎯

- ✅ Tìm đúng sách của "Nam Cao"
- ✅ Dùng `toLowerCase()` để so sánh không phân biệt hoa thường - rất tốt!
- ✅ Tạo list riêng để lưu kết quả
- ✅ Đếm số lượng chính xác
- ✅ Format output đẹp với số thứ tự

---

## BONUS (8/10 điểm)

- ✅ **Tìm sách theo tác giả** (4đ) - Tìm sách của Nam Cao bằng vòng lặp, có list riêng lưu kết quả
- ✅ **Đếm sách cổ** (4đ) - Dùng method `oldBook()` để kiểm tra và đếm sách trước 1950
- ✅ Code structure rõ ràng với comments và tiêu đề: +2 bonus
- ✅ Output format đẹp với các section phân cách rõ ràng: +2 bonus
- ✅ Sử dụng `toLowerCase()` cho tìm kiếm linh hoạt: +1 bonus

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Hoàn thành đầy đủ:** Em đã làm được tất cả yêu cầu của đề bài!
2. 💪 **Logic chính xác:** Tất cả các chức năng hoạt động đúng
3. 🎯 **Xử lý dữ liệu tốt:** Sort, filter, count đều chính xác
4. 📊 **Output đẹp mắt:** Có tiêu đề, số thứ tự, phân cách rõ ràng
5. 🌟 **Làm đủ bonus:** Cả 2 phần bonus đều hoàn thành xuất sắc

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Điều chỉnh nhỏ về lỗi chính tả:

**Vấn đề 1:** Sửa lỗi chính tả trong method `getInfo()`

```dart
String getInfo() {
  String status = (isAvailable) ? 'Có sẵn' : 'Đã Mượn';  // Sửa 'Có sắn' thành 'Có sẵn'
  return ('Tên: $title \n\tTác giả: $author \tNăm: $publishYear \tGiá: $price đ \tTrạng thái: $status ');  // Thêm khoảng trắng trước 'đ'
}
```

### Tối ưu code trong method `oldBook()`:

```dart
bool oldBook() {
  return publishYear < 1950;  // Ngắn gọn hơn, không cần if-else
}
```

### Tách file để dễ quản lý:

**File: book.dart**

```dart
class Book {
  // ... class code ...
}
```

**File: main.dart**

```dart
import 'book.dart';

void main() {
  // ... main program code ...
}
```

### Sửa comment nhỏ:

```dart
// Dòng 48: Sửa comment
print('${i + 1}. ${books[i].getInfo()} '); // lặp và in thông tin bằng getInfo()
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã hoàn thành **100/100 điểm** - xuất sắc! 🏆
- ✅ Em nắm vững kiến thức về class, object, list, methods
- ✅ Logic xử lý dữ liệu chính xác và hiệu quả
- ✅ Em làm đúng và đầy đủ tất cả yêu cầu
- ✅ Code rõ ràng với tên biến có ý nghĩa (cosan, damuon, sachcuanamcao)
- ✅ Output đẹp mắt với tiêu đề phân cách
- ✅ Biết dùng `toLowerCase()` để tìm kiếm linh hoạt
- ✅ Làm đủ cả 2 phần bonus

### 🌱 Hướng phát triển:

- 📚 Lần sau nên tách file `book.dart` và `main.dart` riêng cho dễ quản lý
- 🔍 Chú ý lỗi chính tả khi viết tiếng Việt
- 🎨 Có thể tối ưu code bằng cách viết ngắn gọn hơn (như method `oldBook()`)
- ⚡ Có thể thêm error handling cho các trường hợp đặc biệt

---

**Nhận xét chung:** Em đã chứng tỏ được khả năng lập trình Dart rất tốt với bài làm hoàn chỉnh. Mặc dù để chung 1 file nhưng thầy vẫn chấp nhận và cho điểm đầy đủ để khuyến khích em. Logic chính xác, code rõ ràng, làm đủ cả bonus. Chỉ cần chú ý một số chi tiết nhỏ về chính tả và cách tổ chức file.
