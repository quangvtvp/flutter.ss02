# Quick Start Guide - Lesson 2 Demo

## 🚀 Quick Setup & Run

### Option 1: Run Immediately (Web)
```bash
cd flutter.ss02/flutter/othergame
flutter run -d chrome
```

### Option 2: Run on Mobile Simulator
```bash
# iOS
flutter run -d "iPhone 15"

# Android
flutter run -d emulator-5554
```

### Option 3: Run on Desktop
```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Linux  
flutter run -d linux
```

## 📋 What You'll Learn in 5 Minutes

### 1. Asset Organization (2 min)
Look at the folder structure:
```
assets/images/
├── player/      ← Your hero character
├── enemies/     ← Bad guys
├── items/       ← Coins, gems, stars
└── background/  ← Sky, ground, etc.
```

**Why?** Games have hundreds of assets. Organization is critical!

### 2. Display Sprites (2 min)
Open `lib/screens/game_screen.dart` and find:
```dart
// This shows a sprite at bottom-center
Positioned(
  left: screenSize.width / 2 - 32,  // Center it
  bottom: 100,                        // 100px from bottom
  child: SpriteWidget(/*...*/),      // The actual sprite
)
```

**Try it!** Change `bottom: 100` to `bottom: 200` and hot reload (press 'r')

### 3. The Magic Widget: Stack (1 min)
```dart
Stack(               // Like layers in Photoshop
  children: [
    Background(),    // Layer 1: Bottom
    Player(),        // Layer 2: Middle
    Enemies(),       // Layer 3: Top
  ],
)
```

Everything overlaps! Perfect for games.

## 🎯 5-Minute Exercises

### Exercise 1: Add a New Sprite
**Goal**: Add a fourth collectible item

1. Open `lib/screens/game_screen.dart`
2. Find `_buildCollectibleItems()` method
3. Add this code after the Star sprite:

```dart
// Diamond - Center bottom
Positioned(
  left: screenSize.width / 2 - 24,
  bottom: 200,
  child: Column(
    children: [
      SpriteWidget(
        label: 'DIAMOND',
        color: Color(0xFF00D9FF), // Cyan
        width: 48,
        height: 48,
      ),
      SizedBox(height: 4),
      Text(
        'Diamond',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    ],
  ),
),
```

4. Hot reload (press 'r')
5. See your new cyan diamond sprite! 💎

### Exercise 2: Change Player Position
**Goal**: Move the player to the left side

1. Find `_buildPlayerSprite()` in `game_screen.dart`
2. Change:
```dart
left: screenSize.width / 2 - 32,  // OLD: center
```
To:
```dart
left: 50,  // NEW: left side
```
3. Hot reload and watch it move!

### Exercise 3: Make Sprites Bigger
**Goal**: Increase sprite sizes

1. Find any `SpriteWidget` call
2. Change:
```dart
width: 64,   // OLD
height: 64,
```
To:
```dart
width: 96,   // NEW: 50% bigger
height: 96,
```
3. Hot reload!

## 🎨 Color Codes to Try

Replace sprite colors with these:
```dart
Color(0xFFFF6B6B), // Coral Red
Color(0xFF4ECDC4), // Turquoise
Color(0xFFFFE66D), // Sunny Yellow
Color(0xFFA8E6CF), // Mint Green
Color(0xFFFF8B94), // Pink
Color(0xFFC7CEEA), // Lavender
```

## 🐛 Quick Troubleshooting

**Problem**: Hot reload not working?
- Press 'R' (capital R) for hot restart

**Problem**: Sprite not showing?
- Check if coordinates are within screen bounds
- Use Flutter DevTools to inspect widget tree

**Problem**: App won't run?
```bash
flutter clean
flutter pub get
flutter run
```

## 📚 Key Takeaways (30 seconds)

✅ **Stack** = Layers (like Photoshop)  
✅ **Positioned** = Put things at exact coordinates  
✅ **Assets folder** = Organize by category  
✅ **pubspec.yaml** = Tell Flutter where assets are  
✅ **CustomPaint** = Draw custom shapes (or use Image.asset for real images)

## 🎮 Next Challenge

Can you create a simple game layout with:
- 1 player at the bottom
- 3 enemies at the top
- 5 coins scattered around
- A background color of your choice

Time yourself - try to do it in 10 minutes!

## 💡 Pro Tips

1. **Use hot reload** - Don't restart the whole app every time
2. **Widget inspector** - Press 'i' in terminal to toggle it
3. **Comments** - Read the code comments, they explain a lot
4. **Experiment** - Change numbers and see what happens!

## 🔗 Quick Links

- Main code: `lib/main.dart`
- Game screen: `lib/screens/game_screen.dart`  
- Sprite widget: `lib/widgets/sprite_widget.dart`
- Assets config: `pubspec.yaml`

---

**Ready for Lesson 3?**  
Next up: Making sprites move with touch controls! 🎯
