# Lesson 2: Game Assets & Visual Elements
## Asset Organization Demo

This project demonstrates the asset structure for Lesson 2.

## Asset Folder Structure:
```
assets/
├── images/
│   ├── player/          # Player character sprites
│   │   └── player.png
│   ├── enemies/         # Enemy sprites
│   │   ├── enemy1.png
│   │   └── enemy2.png
│   ├── items/           # Collectible items
│   │   ├── coin.png
│   │   ├── gem.png
│   │   └── star.png
│   └── background/      # Background images
│       └── sky.png
```

## Running the Demo:
Since we don't have actual image assets, this demo uses Flutter's CustomPaint 
to draw colored rectangles representing sprites. This demonstrates:
- Asset folder organization best practices
- Using Positioned widget for absolute positioning
- Loading and displaying multiple visual elements
- Organizing game assets by category

To run with actual images, simply add PNG files to the asset folders and the
app will automatically load them.
