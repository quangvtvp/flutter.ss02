# Lesson 2: Game Assets & Visual Elements Demo

A simple Flutter game project demonstrating **Lesson 2** concepts from the Flutter Game Development course.

## 🎯 Learning Objectives

This project covers the following topics from Lesson 2:

1. **Asset Organization** - Proper folder structure for game assets
2. **Sprite Display** - Showing game sprites on screen
3. **Widget Usage** - Container, Stack, and Positioned widgets
4. **Absolute Positioning** - Placing elements at specific coordinates
5. **Asset Configuration** - Setting up pubspec.yaml for game resources

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── screens/
│   └── game_screen.dart        # Main game screen with sprite demo
└── widgets/
    └── sprite_widget.dart      # Reusable sprite widget

assets/
├── images/
│   ├── player/                 # Player character sprites
│   ├── enemies/                # Enemy sprites
│   ├── items/                  # Collectible items (coins, gems, etc.)
│   └── background/             # Background images
```

## 🎮 What's Demonstrated

### 1. Asset Folder Organization
- Organized by category (player, enemies, items, background)
- Clear folder structure following best practices
- Configured in `pubspec.yaml` for Flutter to recognize

### 2. Sprite Rendering
- **Player sprite** - Blue rectangle at center-bottom
- **Enemy sprites** - Two red rectangles at the top
- **Item sprites** - Coin (yellow), Gem (green), Star (purple)

### 3. Key Flutter Concepts
- **Stack widget** - Layering multiple elements
- **Positioned widget** - Absolute positioning of sprites
- **Container widget** - Styling and layout
- **CustomPaint** - Drawing custom graphics (for demo purposes)

### 4. Positioning Examples
```dart
// Center horizontally, specific vertical position
Positioned(
  left: screenSize.width / 2 - 32,
  bottom: 100,
  child: PlayerSprite(),
)

// Fixed position from left and top
Positioned(
  left: 40,
  top: 60,
  child: EnemySprite(),
)

// Percentage-based positioning
Positioned(
  left: screenSize.width / 2 - 24,
  top: screenSize.height * 0.25,
  child: ItemSprite(),
)
```

## 🚀 Running the Demo

### Prerequisites
- Flutter SDK installed (^3.9.2)
- An IDE (VS Code, Android Studio, or IntelliJ)
- iOS Simulator, Android Emulator, or physical device

### Steps to Run

1. **Navigate to the project directory:**
   ```bash
   cd flutter.ss02/flutter/othergame
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Or run on specific device:**
   ```bash
   flutter run -d chrome      # Web
   flutter run -d macos       # macOS
   flutter run -d emulator-id # Android/iOS
   ```

## 📸 What You'll See

The demo displays:
- A light blue gradient background (representing sky)
- A blue PLAYER sprite at the bottom center
- Two red ENEMY sprites at the top (left and right)
- Three collectible items in the middle area:
  - Yellow COIN (left)
  - Green GEM (center)
  - Purple STAR (right)
- Asset folder structure legend at bottom-left
- Header and footer with lesson information

## 🔧 Technical Details

### Using Real Image Assets

This demo uses `CustomPaint` to draw colored rectangles for demonstration. To use real images:

1. **Add image files to asset folders:**
   ```
   assets/images/player/player.png
   assets/images/enemies/enemy1.png
   assets/images/items/coin.png
   ```

2. **Update SpriteWidget to use Image.asset:**
   ```dart
   class SpriteWidget extends StatelessWidget {
     final String assetPath;
     
     @override
     Widget build(BuildContext context) {
       return Image.asset(
         assetPath,
         width: 64,
         height: 64,
         fit: BoxFit.contain,
       );
     }
   }
   ```

3. **Use the widget:**
   ```dart
   SpriteWidget(assetPath: 'assets/images/player/player.png')
   ```

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2  # For state management (used in later lessons)
```

## 📚 Key Concepts Explained

### Stack Widget
Used to layer widgets on top of each other. Essential for game development where you need to overlay multiple elements.

```dart
Stack(
  children: [
    BackgroundWidget(),
    PlayerWidget(),
    EnemyWidget(),
  ],
)
```

### Positioned Widget
Places a child at specific coordinates within a Stack. Uses absolute positioning.

```dart
Positioned(
  left: 100,    // 100px from left
  top: 50,      // 50px from top
  child: Widget(),
)
```

### Image.asset
Loads image assets from the asset folder:

```dart
Image.asset(
  'assets/images/player/player.png',
  width: 64,
  height: 64,
)
```

## 🎨 Customization Ideas

Try modifying the demo to practice:
1. Change sprite colors in `game_screen.dart`
2. Add more sprites at different positions
3. Adjust sprite sizes (width and height)
4. Change the background gradient colors
5. Add your own image assets and display them

## 📖 Next Steps

After understanding Lesson 2, you'll be ready for:
- **Lesson 3**: Touch Input & Player Controls
- **Lesson 4**: Animation & Game Loop
- **Lesson 5**: Collision Detection & Scoring

## 💡 Tips for Learning

1. **Experiment with positioning** - Try different left/top values
2. **Understand Stack vs. Column** - Stack allows overlapping, Column doesn't
3. **Asset paths matter** - Must match pubspec.yaml configuration
4. **Screen size calculations** - Use MediaQuery for responsive positioning

## 🐛 Troubleshooting

### Assets not loading?
- Check `pubspec.yaml` has correct asset paths
- Run `flutter pub get` after modifying pubspec.yaml
- Ensure asset files exist in the correct folders

### Sprites not showing?
- Check if Positioned coordinates are within screen bounds
- Verify widget tree in Flutter DevTools
- Check console for errors

### Build errors?
- Run `flutter clean` then `flutter pub get`
- Check Flutter SDK version compatibility

## 📝 Notes

- This demo is intentionally simple to focus on core concepts
- Real games would use sprite sheets and animation frames
- For production games, consider using game engines like Flame
- The Casual Games Toolkit provides more advanced features

## 🎓 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Widgets Catalog](https://docs.flutter.dev/ui/widgets)
- [Stack Widget Guide](https://api.flutter.dev/flutter/widgets/Stack-class.html)
- [Asset Management](https://docs.flutter.dev/ui/assets/assets-and-images)

---

**Course**: Flutter Season 2 - Game Development  
**Lesson**: 2 - Game Assets & Visual Elements  
**Created**: 2025
