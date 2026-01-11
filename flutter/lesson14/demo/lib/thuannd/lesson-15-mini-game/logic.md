# Memory Card Game - Giải thích Logic

## 🎮 Tổng quan Game

```
┌─────────────────────────────────────────────────────────────┐
│                    MEMORY CARD GAME                         │
│                                                             │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐                                  │
│   │ ? │ │ ? │ │ ? │ │ ? │   ← 16 thẻ bài (8 cặp)           │
│   └───┘ └───┘ └───┘ └───┘                                  │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐                                  │
│   │ ? │ │ ? │ │ ? │ │ ? │   ← Mỗi emoji xuất hiện 2 lần    │
│   └───┘ └───┘ └───┘ └───┘                                  │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐                                  │
│   │ ? │ │ ? │ │ ? │ │ ? │   ← Tìm tất cả các cặp giống nhau│
│   └───┘ └───┘ └───┘ └───┘                                  │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐                                  │
│   │ ? │ │ ? │ │ ? │ │ ? │                                  │
│   └───┘ └───┘ └───┘ └───┘                                  │
└─────────────────────────────────────────────────────────────┘
```

---

## 📦 Mô hình thẻ bài (Card Model)

Mỗi thẻ bài có các thuộc tính sau:

| Thuộc tính | Ý nghĩa |
|------------|---------|
| **id** | Số định danh duy nhất (0-15) |
| **emoji** | Hình emoji hiển thị |
| **isFlipped** | Thẻ đang lật ngửa hay úp? |
| **isMatched** | Thẻ đã tìm được cặp chưa? |

### Ba trạng thái của thẻ bài

```
   ÚP (Face Down)      LẬT NGỬA (Face Up)     ĐÃ GHÉP CẶP (Matched)
   ┌───────────┐       ┌───────────┐          ┌───────────┐
   │           │       │           │          │           │
   │     ?     │  ──►  │    🎯     │   ──►    │    🎯     │
   │           │       │           │          │     ✓     │
   └───────────┘       └───────────┘          └───────────┘
   
   isFlipped: ❌        isFlipped: ✅          isFlipped: ✅
   isMatched: ❌        isMatched: ❌          isMatched: ✅
```

---

## 🎯 Các biến trạng thái của Game

| Biến | Ý nghĩa |
|------|---------|
| **cards** | Danh sách 16 thẻ bài |
| **firstCardIndex** | Vị trí thẻ đầu tiên đã lật (null nếu chưa lật) |
| **secondCardIndex** | Vị trí thẻ thứ hai đã lật (null nếu chưa lật) |
| **moves** | Số lượt đã chơi |
| **isProcessing** | Đang kiểm tra cặp? (khóa không cho bấm) |

### Trạng thái thay đổi như thế nào?

```
╔════════════════════════════════════════════════════════════╗
║  TRẠNG THÁI BAN ĐẦU                                        ║
╠════════════════════════════════════════════════════════════╣
║  firstCardIndex  = trống (chưa lật thẻ nào)               ║
║  secondCardIndex = trống                                   ║
║  isProcessing    = ❌ (không khóa)                         ║
║  moves           = 0                                       ║
╚════════════════════════════════════════════════════════════╝
                              │
                              ▼ Bấm thẻ đầu tiên (vị trí 5)
╔════════════════════════════════════════════════════════════╗
║  SAU KHI LẬT THẺ ĐẦU TIÊN                                  ║
╠════════════════════════════════════════════════════════════╣
║  firstCardIndex  = 5  ← ĐÃ LƯU!                           ║
║  secondCardIndex = trống                                   ║
║  isProcessing    = ❌                                      ║
║  moves           = 0                                       ║
╚════════════════════════════════════════════════════════════╝
                              │
                              ▼ Bấm thẻ thứ hai (vị trí 11)
╔════════════════════════════════════════════════════════════╗
║  SAU KHI LẬT THẺ THỨ HAI                                   ║
╠════════════════════════════════════════════════════════════╣
║  firstCardIndex  = 5                                       ║
║  secondCardIndex = 11 ← ĐÃ LƯU!                           ║
║  isProcessing    = ✅  ← KHÓA! (đang xử lý)               ║
║  moves           = 1   ← TĂNG LÊN!                        ║
╚════════════════════════════════════════════════════════════╝
```

---

## 🔄 Luồng xử lý khi bấm thẻ

```
                    ┌─────────────────┐
                    │  NGƯỜI CHƠI     │
                    │  BẤM VÀO THẺ    │
                    └────────┬────────┘
                             │
                             ▼
              ╔══════════════════════════════╗
              ║     KIỂM TRA ĐIỀU KIỆN       ║
              ║                              ║
              ║  ❌ Đang xử lý?  → BỎ QUA    ║
              ║  ❌ Thẻ đã lật?  → BỎ QUA    ║
              ║  ❌ Thẻ đã ghép? → BỎ QUA    ║
              ╚══════════════╤═══════════════╝
                             │ ✅ Tất cả OK
                             ▼
              ┌──────────────────────────────┐
              │        LẬT THẺ LÊN           │
              │    (isFlipped = true)        │
              └──────────────┬───────────────┘
                             │
                             ▼
              ┌──────────────────────────────┐
              │   Đây là thẻ ĐẦU TIÊN hay    │
              │        thẻ THỨ HAI?          │
              └──────────────┬───────────────┘
                             │
         ┌───────────────────┴───────────────────┐
         │ THẺ ĐẦU TIÊN                          │ THẺ THỨ HAI
         ▼                                       ▼
┌─────────────────────┐            ┌─────────────────────────┐
│                     │            │                         │
│  • Lưu vị trí thẻ   │            │  • Lưu vị trí thẻ       │
│                     │            │  • Tăng số lượt (+1)    │
│  • Chờ người chơi   │            │  • KHÓA bàn phím        │
│    bấm thẻ tiếp     │            │  • Gọi KIỂM TRA CẶP     │
│                     │            │                         │
└─────────────────────┘            └─────────────────────────┘
```

---

## ⚖️ Logic kiểm tra cặp (Check Match)

```
                    ┌─────────────────┐
                    │   KIỂM TRA CẶP  │
                    └────────┬────────┘
                             │
                             ▼
              ┌──────────────────────────────┐
              │   Lấy 2 thẻ đã lật:          │
              │   • Thẻ 1 (firstCardIndex)   │
              │   • Thẻ 2 (secondCardIndex)  │
              └──────────────┬───────────────┘
                             │
                             ▼
              ╔══════════════════════════════╗
              ║                              ║
              ║   ⏱️  CHỜ 1 GIÂY             ║
              ║                              ║
              ║   (Để người chơi kịp nhìn    ║
              ║    thấy cả 2 thẻ)            ║
              ║                              ║
              ╚══════════════╤═══════════════╝
                             │
                             ▼
              ┌──────────────────────────────┐
              │                              │
              │   SO SÁNH EMOJI              │
              │   Thẻ 1 giống Thẻ 2 không?   │
              │                              │
              └──────────────┬───────────────┘
                             │
         ┌───────────────────┴───────────────────┐
         │                                       │
         ▼ ✅ GIỐNG NHAU!                        ▼ ❌ KHÁC NHAU!
┌─────────────────────┐            ┌─────────────────────────┐
│                     │            │                         │
│  🎉 GHÉP CẶP!       │            │  😢 KHÔNG KHỚP         │
│                     │            │                         │
│  • Đánh dấu cả 2    │            │  • Úp cả 2 thẻ         │
│    thẻ là "matched" │            │    xuống lại           │
│                     │            │                         │
│  • Thẻ giữ nguyên   │            │  • Thẻ trở về          │
│    mặt ngửa         │            │    trạng thái "?"      │
│                     │            │                         │
└──────────┬──────────┘            └────────────┬────────────┘
           │                                    │
           └────────────────┬───────────────────┘
                            │
                            ▼
              ┌──────────────────────────────┐
              │       RESET TRẠNG THÁI       │
              │                              │
              │  • firstCardIndex  = trống   │
              │  • secondCardIndex = trống   │
              │  • isProcessing = ❌ (mở khóa)│
              └──────────────┬───────────────┘
                             │
                             ▼
              ┌──────────────────────────────┐
              │   KIỂM TRA THẮNG GAME        │
              │   (Tất cả thẻ đã ghép cặp?)  │
              └──────────────────────────────┘
```

---

## 🎯 Ví dụ trực quan: Một lượt chơi hoàn chỉnh

### Bước 1: Bàn cờ ban đầu (đã xáo trộn)
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │ ? │ │ ? │ │ ? │ │ ? │   Ẩn bên dưới: 🎯 🌟 🎨 🎯
       └───┘ └───┘ └───┘ └───┘
Vị trí:  4     5     6     7
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │ ? │ │ ? │ │ ? │ │ ? │   Ẩn bên dưới: 🎭 🌟 🎨 🎭
       └───┘ └───┘ └───┘ └───┘

Trạng thái: firstCardIndex = trống, moves = 0
```

### Bước 2: Bấm thẻ vị trí 0
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎯 │ │ ? │ │ ? │ │ ? │   ← Thẻ 0 lật lên!
       └───┘ └───┘ └───┘ └───┘
Vị trí:  4     5     6     7
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │ ? │ │ ? │ │ ? │ │ ? │
       └───┘ └───┘ └───┘ └───┘

Trạng thái: firstCardIndex = 0, moves = 0
            ⏳ Chờ bấm thẻ tiếp theo...
```

### Bước 3: Bấm thẻ vị trí 3 (TRÙNG! 🎯 == 🎯)
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎯 │ │ ? │ │ ? │ │🎯 │   ← Cả 2 thẻ hiện lên!
       └───┘ └───┘ └───┘ └───┘

Trạng thái: firstCardIndex = 0, secondCardIndex = 3
            isProcessing = ✅ (KHÓA), moves = 1
       
            ⏱️ Đang chờ 1 giây...
```

### Bước 4: Sau 1 giây - GHÉP CẶP THÀNH CÔNG!
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎯✓│ │ ? │ │ ? │ │🎯✓│   ← Đã ghép! Giữ nguyên mặt ngửa
       └───┘ └───┘ └───┘ └───┘

Trạng thái: firstCardIndex = trống, secondCardIndex = trống
            isProcessing = ❌ (MỞ KHÓA), moves = 1
            Thẻ 0 và 3: isMatched = ✅
```

### Bước 5: Bấm thẻ vị trí 1, rồi vị trí 4 (KHÔNG TRÙNG! 🌟 ≠ 🎭)
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎯✓│ │🌟 │ │ ? │ │🎯✓│
       └───┘ └───┘ └───┘ └───┘
Vị trí:  4     5     6     7
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎭 │ │ ? │ │ ? │ │ ? │
       └───┘ └───┘ └───┘ └───┘

Trạng thái: isProcessing = ✅ (KHÓA), moves = 2
            ⏱️ Đang chờ 1 giây...
```

### Bước 6: Sau 1 giây - KHÔNG KHỚP, úp thẻ lại!
```
Vị trí:  0     1     2     3
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │🎯✓│ │ ? │ │ ? │ │🎯✓│   ← Thẻ 1 và 4 úp xuống lại
       └───┘ └───┘ └───┘ └───┘
Vị trí:  4     5     6     7
       ┌───┐ ┌───┐ ┌───┐ ┌───┐
       │ ? │ │ ? │ │ ? │ │ ? │
       └───┘ └───┘ └───┘ └───┘

Trạng thái: firstCardIndex = trống, secondCardIndex = trống
            isProcessing = ❌ (MỞ KHÓA), moves = 2
```

---

## 🏆 Điều kiện thắng game

Khi **TẤT CẢ** các thẻ đều có trạng thái đã ghép cặp:

```
Tất cả thẻ đã ghép cặp:
┌───┐ ┌───┐ ┌───┐ ┌───┐
│🎯✓│ │🌟✓│ │🎨✓│ │🎯✓│
└───┘ └───┘ └───┘ └───┘
┌───┐ ┌───┐ ┌───┐ ┌───┐
│🎭✓│ │🌟✓│ │🎨✓│ │🎭✓│
└───┘ └───┘ └───┘ └───┘

     ╔═══════════════════════╗
     ║   🎉 CHIẾN THẮNG! 🎉  ║
     ║                       ║
     ║  Hoàn thành trong     ║
     ║      X lượt!          ║
     ╚═══════════════════════╝
```

---

## 💡 Các khái niệm quan trọng cần nhớ

### 1. Tại sao cần biến isProcessing?

```
Không có isProcessing:           Có isProcessing:
                                 
Bấm thẻ 1 → Lật                 Bấm thẻ 1 → Lật
Bấm thẻ 2 → Lật                 Bấm thẻ 2 → Lật
Bấm thẻ 3 → Lật ❌ LỖI!         Bấm thẻ 3 → 🔒 BỊ CHẶN ✅
Bấm thẻ 4 → Lật ❌ LỖI!         Chờ 1 giây...
                                 Mở khóa
                                 Bấm thẻ 3 → Lật ✅
```

**Giải thích:** Biến isProcessing ngăn người chơi bấm thêm thẻ trong khi đang đợi kiểm tra cặp.

---

### 2. Tại sao phải chờ 1 giây?

```
Không chờ:                       Có chờ:
                                 
Bấm thẻ 1 → 🎯                  Bấm thẻ 1 → ��
Bấm thẻ 2 → 🌟                  Bấm thẻ 2 → 🌟
Úp ngay lập tức!                 
                                 ⏱️ Chờ 1 giây...
😕 Không kịp nhìn!              👀 Người chơi nhìn thấy cả 2
                                 
                                 Úp thẻ xuống
```

**Giải thích:** Thời gian chờ giúp người chơi có thời gian ghi nhớ vị trí của các thẻ.

---

### 3. Hai giai đoạn bấm thẻ

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   GIAI ĐOẠN 1              GIAI ĐOẠN 2                     │
│   (Thẻ đầu tiên)           (Thẻ thứ hai)                   │
│                                                             │
│   • Lật thẻ lên            • Lật thẻ lên                   │
│   • LƯU vị trí             • LƯU vị trí                    │
│   • Chờ tiếp...            • TĂNG số lượt                  │
│                            • KHÓA bàn phím                 │
│                            • SO SÁNH 2 thẻ                 │
│                            • Xử lý kết quả                 │
│                            • MỞ KHÓA                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🎨 So sánh các phiên bản

| Phiên bản | Tính năng |
|-----------|-----------|
| **V1 - Basic** | Xáo bài + Lật thẻ (không kiểm tra cặp) |
| **V2 - Match** | + Kiểm tra cặp + Phát hiện thắng + Đếm lượt |
| **V3 - Animation** | + Hiệu ứng động (mượt mà hơn) |
| **V4 - Sound** | + Âm thanh (lật, ghép, thắng) |

---

## 📋 Tóm tắt luồng game

```
┌────────────────────────────────────────────────────────────────┐
│                                                                │
│   1. KHỞI TẠO                                                  │
│      • Tạo 16 thẻ (8 cặp emoji)                               │
│      • Xáo trộn ngẫu nhiên                                    │
│                                                                │
│   2. VÒNG LẶP GAME                                            │
│      ┌──────────────────────────────────────────────────────┐ │
│      │ a. Người chơi bấm thẻ đầu tiên → LƯU                 │ │
│      │ b. Người chơi bấm thẻ thứ hai  → SO SÁNH             │ │
│      │ c. Nếu TRÙNG  → Đánh dấu ghép cặp                    │ │
│      │    Nếu KHÔNG  → Úp 2 thẻ xuống                       │ │
│      │ d. Kiểm tra thắng                                     │ │
│      │ e. Lặp lại từ bước a                                  │ │
│      └──────────────────────────────────────────────────────┘ │
│                                                                │
│   3. KẾT THÚC                                                  │
│      • Tất cả thẻ đã ghép → THẮNG!                            │
│      • Hiển thị số lượt đã chơi                               │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```
