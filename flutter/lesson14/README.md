# Lesson 14 - Career Analysis App with StatefulWidget

## Overview
This project is a refactored version of the member game from lesson13/quanglm, with two key improvements:

1. **Changed from ValueNotifier to StatefulWidget** for state management
2. **Updated wording** to avoid sensitive phrases and better reflect the app's purpose as an AI-powered career analysis tool

## What Changed

### State Management Approach
- **Before (lesson13)**: Used `ValueNotifier<List<Member>>` with `ValueListenableBuilder`
- **After (lesson14)**: Uses `StatefulWidget` with `setState()` for state updates

### Updated Terminology
The app now focuses on AI-based career analysis rather than fortune-telling:

| Old Term | New Term | Context |
|----------|----------|---------|
| "xem bói" | "phân tích" | Input validation message |
| "Máy Tiên Tri Nghề Nghiệp" | "AI Phân Tích Nghề Nghiệp" | App title |
| "tiên tri" | "phân tích" | Form header |
| "Dự đoán ngay" | "Phân tích ngay" | Button text |
| "Mô tả ngắn" | "Đặc điểm nổi bật" | Input field label |
| "siêu hài hước, trùm toán..." | "chăm chỉ, tư duy logic tốt, giỏi giao tiếp..." | Hint text examples |
| "Nghề nghiệp tương lai" | "Nghề nghiệp phù hợp" | Result display |

### Updated Career Suggestions
The app now suggests more professional careers:
- Chuyên gia phân tích dữ liệu
- Nhà tư vấn chiến lược kinh doanh
- Kỹ sư phần mềm AI
- Chuyên gia trải nghiệm người dùng (UX)
- Nhà thiết kế sáng tạo nội dung
- Quản lý dự án công nghệ
- Chuyên gia marketing số
- Nhà tâm lý học tổ chức
- Giảng viên và huấn luyện viên
- Chuyên gia tư vấn phát triển cá nhân

## How to Run

### Demo Project (uses StatefulWidget)
```bash
cd demo
flutter pub get
flutter run
```

### QuangLM Stateful Project (uses StatefulWidget)
```bash
cd quanglm_stateful
flutter pub get
flutter run
```

## Key Concepts Demonstrated

### StatefulWidget vs ValueNotifier

**StatefulWidget approach (this lesson):**
```dart
class _MemberFunnyGameScreenState extends State<MemberFunnyGameScreen> {
  List<Member> _members = [];
  
  void _addMember() {
    setState(() {
      _members = [..._members, newMember];
    });
  }
}
```

**ValueNotifier approach (lesson13):**
```dart
class MemberFunnyGameScreen extends StatelessWidget {
  final ValueNotifier<List<Member>> _membersNotifier = ValueNotifier([]);
  
  void _addMember() {
    _membersNotifier.value = [..._membersNotifier.value, newMember];
  }
}
```

### When to Use Each Approach

**Use StatefulWidget when:**
- You're learning Flutter basics
- Your state is simple and local to one widget
- You need lifecycle methods (initState, dispose)
- You want the standard Flutter approach

**Use ValueNotifier when:**
- You want to keep widgets stateless
- You need fine-grained rebuild control
- You're building smaller, reusable components
- You want slightly better performance for specific rebuilds

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   └── member.dart                    # Member data model
└── screens/
    └── member_funny_game_screen.dart  # Main screen (StatefulWidget)
```

## Learning Objectives

1. Understand StatefulWidget and setState()
2. Properly dispose of controllers to prevent memory leaks
3. Update UI in response to state changes
4. Use culturally appropriate terminology in apps
5. Structure Flutter apps with clear separation of concerns
