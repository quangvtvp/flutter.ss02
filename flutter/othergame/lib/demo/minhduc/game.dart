import 'dart:async';
import 'dart:html' as html; // for audio (works on web / DartPad)
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart'; // Import for Ticker
import 'package:provider/provider.dart'; // Allowed package for state management

// ---------------------------
// Entry
// ---------------------------
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AdventureRunDeluxe());
}

class AdventureRunDeluxe extends StatelessWidget {
  const AdventureRunDeluxe({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Run',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: SafeArea(child: GameContainer())),
    );
  }
}

// ---------------------------
// Game container (manages overlays & game state)
// ---------------------------
class GameContainer extends StatefulWidget {
  const GameContainer({super.key});
  @override
  State<GameContainer> createState() => _GameContainerState();
}

enum GameState { menu, playing, paused, gameOver, howToPlay }

class _GameContainerState extends State<GameContainer> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _lastFrameTime = 0; // Use a double for elapsed time in seconds
  GameState state = GameState.menu;
  late GameModel _gameModel; // Changed to late and initialized with callbacks
  // audio
  html.AudioElement? bgm;
  html.AudioElement? sfxPickup;
  html.AudioElement? sfxHit;

  @override
  void initState() {
    super.initState();
    _gameModel = GameModel(
      onItemCollected: playPickup,
      onPlayerDied: endGame,
      onPlayerHit: playHitSound,
      onVolumeChanged: _updateAudioElementVolumes, // Callback to update actual audio element volumes
      initialGlobalVolume: 0.5, // Start with 50% global volume
    );
    _ticker = createTicker(_onTick)..start();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      // Ancient Chinese Guzheng Music (Public Domain from archive.org)
      bgm = html.AudioElement('https://archive.org/download/Chinese_Traditional_Guzheng_Music/ChineseTraditionalGuzhengMusic.mp3')
        ..loop = true;
      sfxPickup = html.AudioElement('https://www.soundjay.com/buttons/sounds/button-16.mp3');
      sfxHit = html.AudioElement('https://www.soundjay.com/misc/sounds/fail-buzzer-02.mp3');

      // Set initial volumes based on the game model's current global volume
      _gameModel.triggerVolumeUpdate(); // Call this to ensure initial volumes are set
    } catch (e) {
      // audio might fail on some environments, log error but don't crash
      debugPrint('Audio loading failed: $e');
      bgm = null;
      sfxPickup = null;
      sfxHit = null;
    }
  }

  // Callback to update the actual html.AudioElement volumes
  void _updateAudioElementVolumes(double bgmVol, double pickupVol, double hitVol) {
    bgm?.volume = bgmVol;
    sfxPickup?.volume = pickupVol;
    sfxHit?.volume = hitVol;
  }

  void _onTick(Duration elapsed) {
    final double currentTime = elapsed.inMicroseconds / 1000000.0; // Convert to seconds
    final double dt = currentTime - _lastFrameTime;
    _lastFrameTime = currentTime;

    if (state == GameState.playing) {
      _gameModel.update(dt);
    }
  }

  void startGame() {
    _gameModel.reset();
    setState(() {
      state = GameState.playing;
    });
    try {
      bgm?.play();
    } catch (_) {}
  }

  void pauseGame() {
    setState(() {
      state = GameState.paused;
    });
    try {
      bgm?.pause();
    } catch (_) {}
  }

  void resumeGame() {
    setState(() {
      state = GameState.playing;
    });
    try {
      bgm?.play();
    } catch (_) {}
  }

  void endGame() {
    setState(() {
      state = GameState.gameOver;
    });
    try {
      bgm?.pause();
    } catch (_) {}
  }

  void playPickup() {
    try {
      sfxPickup?.currentTime = 0;
      sfxPickup?.play();
    } catch (_) {}
  }

  void playHitSound() {
    try {
      sfxHit?.currentTime = 0;
      sfxHit?.play();
    } catch (_) {}
  }

  void showHowToPlay() {
    setState(() {
      state = GameState.howToPlay;
    });
  }

  void backToMenu() {
    setState(() {
      state = GameState.menu;
    });
    try {
      bgm?.pause();
    } catch (_) {}
  }

  @override
  void dispose() {
    _ticker.dispose();
    try {
      bgm?.pause();
      sfxPickup?.pause();
      sfxHit?.pause();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // full screen stack
    return ChangeNotifierProvider<GameModel>(
      create: (BuildContext context) => _gameModel,
      builder: (BuildContext context, Widget? child) {
        final GameModel gameModel = context.watch<GameModel>(); // Watch the model for UI updates
        return RawKeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          autofocus: true,
          onKey: (RawKeyEvent ev) {
            if (ev is RawKeyDownEvent) {
              if (state == GameState.playing) {
                if (ev.logicalKey == LogicalKeyboardKey.arrowLeft) gameModel.moveLeft();
                if (ev.logicalKey == LogicalKeyboardKey.arrowRight) gameModel.moveRight();
                if (ev.logicalKey == LogicalKeyboardKey.space || ev.logicalKey == LogicalKeyboardKey.keyW || ev.logicalKey == LogicalKeyboardKey.arrowUp) gameModel.jump();
                if (ev.logicalKey == LogicalKeyboardKey.keyP) pauseGame();
              } else if (state == GameState.menu && ev.logicalKey == LogicalKeyboardKey.enter) {
                startGame();
              } else if (state == GameState.paused && ev.logicalKey == LogicalKeyboardKey.keyP) {
                resumeGame();
              } else if (state == GameState.gameOver && ev.logicalKey == LogicalKeyboardKey.enter) {
                startGame();
              }
            }
          },
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            final double w = constraints.maxWidth;
            final double h = constraints.maxHeight;
            return Stack(children: <Widget>[
              // Parallax Background (three layers using network images)
              ParallaxBackground(w: w, h: h, time: _lastFrameTime),

              // Game area (centered)
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (TapDownDetails d) {
                    // tap on right to move right, left to move left, double tap for jump
                    final double x = d.localPosition.dx;
                    if (x > w * 0.66) {
                      gameModel.moveRight();
                    } else if (x < w * 0.33) {
                      gameModel.moveLeft();
                    } else {
                      gameModel.jump();
                    }
                  },
                  onDoubleTap: () => gameModel.jump(),
                  child: CustomPaint(
                    painter: GamePainter(model: gameModel, t: _lastFrameTime),
                    child: Container(),
                  ),
                ),
              ),

              // HUD
              Positioned(top: 18, left: 18, child: HUD(model: gameModel)),
              // Controls (mobile)
              Positioned(
                bottom: 22,
                left: 18,
                child: ControlButtons(
                  onLeft: gameModel.moveLeft,
                  onRight: gameModel.moveRight,
                  onJump: gameModel.jump,
                ),
              ),

              // Overlay: Menu / Pause / GameOver
              if (state == GameState.menu)
                MenuOverlay(
                  onStart: startGame,
                  onHowToPlay: showHowToPlay,
                ),
              if (state == GameState.paused)
                PauseOverlay(
                  onResume: resumeGame,
                  onQuit: backToMenu,
                ),
              if (state == GameState.gameOver)
                GameOverOverlay(
                  score: gameModel.score,
                  highScore: gameModel.highScore,
                  onRestart: startGame,
                  onMenu: backToMenu,
                ),
              if (state == GameState.howToPlay)
                HowToPlayOverlay(
                  onBackToMenu: backToMenu,
                ),

              // minimalist bottom-right info
              Positioned(bottom: 10, right: 10, child: Text('Adventure Run', style: TextStyle(color: Colors.white.withOpacity(0.6))))
            ]);
          }),
        );
      },
    );
  }
}

// ---------------------------
// Parallax Background Widget
// ---------------------------
class ParallaxBackground extends StatelessWidget {
  final double w, h, time;
  const ParallaxBackground({required this.w, required this.h, required this.time, super.key});

  // small set of nature images (picsum) for demo; they tile well
  String _img(String seed, [int w = 1400]) => 'https://picsum.photos/seed/$seed/${w}';

  @override
  Widget build(BuildContext context) {
    // compute offsets
    final double offset1 = (time * 8) % w;
    final double offset2 = (time * 20) % w;
    final double offset3 = (time * 40) % w;

    return Stack(children: <Widget>[
      // far
      Positioned(left: -offset1, top: 0, width: w * 2, height: h, child: Image.network(_img('mountain_far'), fit: BoxFit.cover)),
      // mid
      Positioned(left: -offset2 * 0.6, top: 0, width: w * 2, height: h * 0.9, child: Opacity(opacity: 0.95, child: Image.network(_img('trees_mid'), fit: BoxFit.cover))),
      // near (foreground silhouette)
      Positioned(left: -offset3 * 0.3, top: h * 0.2, width: w * 2, height: h * 0.8, child: Opacity(opacity: 0.95, child: Image.network(_img('plants_near'), fit: BoxFit.cover))),
      // subtle gradient overlay to unify palette
      Container(decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[Colors.transparent, Colors.black.withOpacity(0.15)], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
    ]);
  }
}

// ---------------------------
// GameModel: game state & logic (now a ChangeNotifier)
// ---------------------------
class GameModel extends ChangeNotifier {
  // world coords: x runs from 0..1 for screen reference
  static const double _groundY = 0.78; // ground baseline (fraction of screen height)
  static const double _playerStartX = 0.18; // fraction of screen width (left area)
  static const double _playerMaxX = 0.4; // Max player X
  static const double _playerMinX = 0.06; // Min player X

  double playerX;
  double playerY;
  double vx;
  double vy;
  bool onGround;
  bool jumping;
  final double gravity = 2.6; // tuned for feel
  final double jumpInitial = -1.15;
  int score;
  int highScore;
  int health;
  final Random rnd = Random();

  // items: each is at (x fraction, y fraction)
  List<GameItem> items;
  // hazards
  List<Hazard> hazards;

  double scrollSpeed; // world scroll speed (fraction/sec)
  double worldTime;

  // particles
  List<Particle> particles; // Changed to non-final to allow reassignment with .map().toList()

  // Audio properties
  double _currentGlobalVolume; // 0.0 to 1.0, applies to all sounds
  static const double _bgmBaseVolume = 0.25;
  static const double _sfxPickupBaseVolume = 0.8;
  static const double _sfxHitBaseVolume = 0.7;

  // Callbacks for external events (e.g., playing sounds, updating audio volumes)
  final VoidCallback? onItemCollected;
  final VoidCallback? onPlayerDied;
  final VoidCallback? onPlayerHit;
  final Function(double bgmVol, double pickupVol, double hitVol)? onVolumeChanged; // New callback

  GameModel({
    this.onItemCollected,
    this.onPlayerDied,
    this.onPlayerHit,
    this.onVolumeChanged,
    double initialGlobalVolume = 0.5,
  })  : playerX = _playerStartX,
        playerY = _groundY,
        vx = 0,
        vy = 0,
        onGround = true,
        jumping = false,
        score = 0,
        highScore = 0,
        health = 3,
        items = <GameItem>[],
        hazards = <Hazard>[],
        particles = <Particle>[],
        scrollSpeed = 0.22,
        worldTime = 0,
        _currentGlobalVolume = initialGlobalVolume {
    reset();
    // Trigger initial volume settings for audio elements
    triggerVolumeUpdate();
  }

  double get globalVolume => _currentGlobalVolume;
  void setGlobalVolume(double newVolume) {
    _currentGlobalVolume = newVolume.clamp(0.0, 1.0);
    triggerVolumeUpdate(); // Notify external audio elements
    notifyListeners(); // Notify UI for slider update
  }

  // Explicitly call this to force an update of external audio element volumes
  void triggerVolumeUpdate() {
    onVolumeChanged?.call(
      _currentGlobalVolume * _bgmBaseVolume,
      _currentGlobalVolume * _sfxPickupBaseVolume,
      _currentGlobalVolume * _sfxHitBaseVolume,
    );
  }

  void reset() {
    playerX = _playerStartX;
    playerY = _groundY;
    vx = 0;
    vy = 0;
    onGround = true;
    jumping = false;
    score = 0;
    health = 3;
    items = List<GameItem>.generate(6, (int i) => spawnItem(x: 0.6 + i * 0.15 * rnd.nextDouble()));
    hazards = <Hazard>[spawnHazard(x: 1.2)]; // Start with one hazard
    particles.clear();
    worldTime = 0;
    scrollSpeed = 0.22;
    // highScore is persistent across resets within the session, unless explicitly reset
    notifyListeners();
  }

  GameItem spawnItem({double? x}) {
    final double px = x ?? (0.9 + rnd.nextDouble() * 0.6);
    final double py = 0.45 + rnd.nextDouble() * 0.28;
    final double size = 0.03 + rnd.nextDouble() * 0.04;
    return GameItem(x: px, y: py, size: size, kind: rnd.nextBool() ? ItemKind.star : ItemKind.leaf);
  }

  Hazard spawnHazard({double? x}) {
    final double px = x ?? (1.0 + rnd.nextDouble() * 0.8);
    final double py = _groundY; // Grounded hazard
    final double size = 0.04 + rnd.nextDouble() * 0.02;
    return Hazard(x: px, y: py, size: size, kind: HazardKind.spike);
  }

  void update(double dt) {
    worldTime += dt;
    // gravity
    vy += gravity * dt;
    playerY += vy * dt;
    if (playerY >= _groundY) {
      playerY = _groundY;
      vy = 0;
      onGround = true;
      jumping = false;
    } else {
      onGround = false;
    }

    final double currentScrollSpeed = scrollSpeed * (0.6 + score / 200.0); // speed up slowly with score

    // Advance items to left, respawn
    // FIX: Use map to create new immutable GameItem instances with updated x
    items = items.map<GameItem>((GameItem it) => it.copyWith(x: it.x - currentScrollSpeed * dt)).toList();
    items.removeWhere((GameItem it) => it.x < -0.1);
    while (items.length < 6) {
      items.add(spawnItem(x: 0.9 + rnd.nextDouble() * 0.6));
    }

    // Advance hazards to left, respawn
    // FIX: Use map to create new immutable Hazard instances with updated x
    hazards = hazards.map<Hazard>((Hazard hzd) => hzd.copyWith(x: hzd.x - currentScrollSpeed * dt)).toList();
    hazards.removeWhere((Hazard hzd) => hzd.x < -0.1);
    if (hazards.length < 2 && rnd.nextDouble() < 0.008) {
      // Chance to spawn new hazard
      hazards.add(spawnHazard(x: 1.0 + rnd.nextDouble() * 0.8));
    }

    // collision checks (simple bounding)
    for (GameItem it in List<GameItem>.from(items)) {
      final double dx = (it.x - playerX).abs();
      final double dy = (it.y - playerY).abs();
      final double catchDist = 0.06 + it.size;
      if (dx < catchDist && dy < 0.07 + it.size) {
        // collected
        items.remove(it);
        score += (it.kind == ItemKind.star ? 15 : 8);
        onItemCollected?.call(); // Play pickup sound

        // spawn particle burst
        for (int i = 0; i < 12; i++) {
          particles.add(Particle(
            x: it.x,
            y: it.y,
            vx: (rnd.nextDouble() - 0.5) * 0.7,
            vy: (rnd.nextDouble() - 0.6) * 0.9,
            life: 0.6 + rnd.nextDouble() * 0.6,
            color: it.kind == ItemKind.star ? Colors.amber : Colors.lightGreenAccent,
            size: 0.008 + rnd.nextDouble() * 0.015,
          ));
        }
      }
    }

    // Hazard collision
    for (Hazard hzd in List<Hazard>.from(hazards)) {
      final double dx = (hzd.x - playerX).abs();
      final double dy = (hzd.y - playerY).abs();
      final double hitDistX = 0.03 + hzd.size; // Player is approx 0.02 wide
      final double hitDistY = 0.04 + hzd.size; // Player is approx 0.04 tall

      if (dx < hitDistX && dy < hitDistY) {
        // Hit hazard
        hazards.remove(hzd); // Remove hazard after hit
        health--;
        onPlayerHit?.call(); // Play hit sound
        // Spawn small red particles
        for (int i = 0; i < 8; i++) {
          particles.add(Particle(
            x: hzd.x,
            y: hzd.y,
            vx: (rnd.nextDouble() - 0.5) * 0.5,
            vy: (rnd.nextDouble() - 0.6) * 0.7,
            life: 0.4 + rnd.nextDouble() * 0.4,
            color: Colors.redAccent,
            size: 0.006 + rnd.nextDouble() * 0.01,
          ));
        }

        if (health <= 0) {
          onPlayerDied?.call(); // Notify GameContainer about game over
        }
      }
    }

    // update particles
    // FIX: Use map to create new immutable Particle instances with updated properties
    particles = particles.map<Particle>((Particle p) {
      final double newLife = p.life - dt;
      final double newVy = p.vy + 2.2 * dt; // Apply gravity to vy
      final double newX = p.x + p.vx * dt;
      final double newY = p.y + newVy * dt;

      return p.copyWith(
        life: newLife,
        x: newX,
        y: newY,
        vy: newVy,
      );
    }).where((Particle p) => p.life > 0).toList(); // Filter out particles whose life is <= 0

    if (score > highScore) {
      highScore = score;
    }

    notifyListeners(); // Notify all listening widgets that the model has changed
  }

  void moveLeft() {
    playerX -= 0.02;
    if (playerX < _playerMinX) {
      playerX = _playerMinX;
    }
    notifyListeners();
  }

  void moveRight() {
    playerX += 0.02;
    if (playerX > _playerMaxX) {
      playerX = _playerMaxX; // keep player mostly left
    }
    notifyListeners();
  }

  void jump() {
    if (onGround) {
      vy = jumpInitial;
      onGround = false;
      jumping = true;
    }
    notifyListeners();
  }
}

// ---------------------------
// Game entity classes
// ---------------------------
enum ItemKind { star, leaf }

@immutable
class GameItem {
  final double x;
  final double y;
  final double size;
  final ItemKind kind;
  GameItem({required this.x, required this.y, required this.size, required this.kind});

  // Allows modification for game logic by creating new instance
  GameItem copyWith({double? x, double? y, double? size, ItemKind? kind}) {
    return GameItem(
      x: x ?? this.x,
      y: y ?? this.y,
      size: size ?? this.size,
      kind: kind ?? this.kind,
    );
  }
}

enum HazardKind { spike }

@immutable
class Hazard {
  final double x;
  final double y;
  final double size;
  final HazardKind kind;
  Hazard({required this.x, required this.y, required this.size, required this.kind});

  Hazard copyWith({double? x, double? y, double? size, HazardKind? kind}) {
    return Hazard(
      x: x ?? this.x,
      y: y ?? this.y,
      size: size ?? this.size,
      kind: kind ?? this.kind,
    );
  }
}

@immutable
class Particle {
  final double x;
  final double y;
  final double vx;
  final double vy;
  final double life;
  final double size;
  final Color color;
  Particle({required this.x, required this.y, required this.vx, required this.vy, required this.life, required this.color, required this.size});

  Particle copyWith({double? x, double? y, double? vx, double? vy, double? life, Color? color, double? size}) {
    return Particle(
      x: x ?? this.x,
      y: y ?? this.y,
      vx: vx ?? this.vx,
      vy: vy ?? this.vy,
      life: life ?? this.life,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
}

// ---------------------------
// GamePainter: draw world
// ---------------------------
class GamePainter extends CustomPainter {
  final GameModel model;
  final double t;
  GamePainter({required this.model, required this.t});

  @override
  void paint(Canvas canvas, Size size) {
    // coordinate helpers
    double sx(double fx) => fx * size.width;
    double sy(double fy) => fy * size.height;

    // ground area
    final double groundTop = sy(GameModel._groundY);
    final Rect groundRect = Rect.fromLTWH(0, groundTop, size.width, size.height - groundTop);

    // subtle fog above foreground
    final Rect fogRect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw layered ground (soft)
    final Paint groundGrad = Paint()
      ..shader = LinearGradient(colors: <Color>[Colors.brown[700]!, Colors.green[800]!], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(groundRect);
    canvas.drawRect(groundRect, groundGrad);

    // draw rolling bushes (foreground decals)
    final Paint bushPaint = Paint()..color = Colors.green[900]!.withOpacity(0.9);
    for (double i = -0.5; i < size.width / 80; i++) {
      final double cx = (i * 80 + (sin(t * 0.6 + i) * 8));
      final double cy = groundTop + 28 + cos(i + t) * 6;
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 120, height: 38), bushPaint);
    }

    // draw items
    for (GameItem it in model.items) {
      final double px = sx(it.x);
      final double py = sy(it.y);
      final double r = min(size.shortestSide, 600) * it.size;
      if (it.kind == ItemKind.star) {
        _drawStar(canvas, Offset(px, py), r, Colors.amberAccent);
      } else {
        _drawLeaf(canvas, Offset(px, py), r, Colors.lightGreenAccent);
      }
    }

    // draw hazards
    for (Hazard hzd in model.hazards) {
      final double px = sx(hzd.x);
      final double py = sy(hzd.y);
      final double r = min(size.shortestSide, 600) * hzd.size;
      if (hzd.kind == HazardKind.spike) {
        _drawSpikeHazard(canvas, Offset(px, py), r, Colors.grey[700]!);
      }
    }

    // draw player with soft shadow + backpack detail
    final double playerPx = sx(model.playerX);
    final double playerPy = sy(model.playerY);
    // shadow
    final Paint shadow = Paint()..color = Colors.black.withOpacity(0.25);
    canvas.drawOval(Rect.fromCenter(center: Offset(playerPx, playerPy + 28), width: 64, height: 16), shadow);
    // body
    final Rect bodyRect = Rect.fromCenter(center: Offset(playerPx, playerPy - 6), width: 42, height: 56);
    final Paint bodyPaint = Paint()..shader = LinearGradient(colors: <Color>[Colors.deepOrange, Colors.orangeAccent]).createShader(bodyRect);
    canvas.drawRRect(RRect.fromRectAndRadius(bodyRect, const Radius.circular(12)), bodyPaint);
    // helmet/head
    final Paint headPaint = Paint()..color = Colors.brown[200]!;
    canvas.drawCircle(Offset(playerPx, playerPy - 28), 12, headPaint);
    // backpack
    final Rect packRect = Rect.fromCenter(center: Offset(playerPx - 14, playerPy - 2), width: 18, height: 28);
    final Paint packPaint = Paint()..color = Colors.green[700]!;
    canvas.drawRRect(RRect.fromRectAndRadius(packRect, const Radius.circular(6)), packPaint);

    // small particles
    for (Particle p in model.particles) {
      final double px = sx(p.x);
      final double py = sy(p.y);
      // FIX: Clamp opacity value to be between 0.0 and 1.0 inclusive.
      // p.life can sometimes be > 1.0 initially, causing the assertion failure.
      final Paint paint = Paint()..color = p.color.withOpacity((p.life / 1.0).clamp(0.0, 1.0));
      canvas.drawCircle(Offset(px, py), p.size * size.shortestSide, paint);
    }

    // subtle vignette
    final Paint vignette = Paint()
      ..shader = RadialGradient(colors: <Color>[Colors.transparent, Colors.black.withOpacity(0.25)], stops: <double>[0.6, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(fogRect, vignette);
  }

  void _drawStar(Canvas c, Offset center, double r, Color color) {
    final Paint paint = Paint()..color = color;
    final Path p = Path();
    const int n = 5;
    for (int i = 0; i < n * 2; i++) {
      final double a = i * pi / n;
      final double rad = (i % 2 == 0) ? r : r * 0.45;
      final double x = center.dx + cos(a) * rad;
      final double y = center.dy + sin(a) * rad;
      if (i == 0) {
        p.moveTo(x, y);
      } else {
        p.lineTo(x, y);
      }
    }
    p.close();
    c.drawPath(p, paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0));
    c.drawPath(p, paint);
  }

  void _drawLeaf(Canvas c, Offset center, double r, Color color) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    path.moveTo(center.dx, center.dy - r);
    path.quadraticBezierTo(center.dx + r * 0.6, center.dy - r * 0.3, center.dx, center.dy + r);
    path.quadraticBezierTo(center.dx - r * 0.6, center.dy - r * 0.3, center.dx, center.dy - r);
    path.close();
    c.drawPath(path, paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.0));
  }

  void _drawSpikeHazard(Canvas c, Offset center, double r, Color color) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx - r * 0.8, center.dy - r * 1.5);
    path.lineTo(center.dx + r * 0.8, center.dy - r * 1.5);
    path.close();
    c.drawPath(path, paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.0));
    c.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ---------------------------
// HUD widget
// ---------------------------
class HUD extends StatelessWidget {
  final GameModel model;
  const HUD({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(12)),
        child: Row(children: <Widget>[
          const Icon(Icons.favorite, color: Colors.redAccent),
          const SizedBox(width: 8),
          Text('${model.health}', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(width: 18),
          const Icon(Icons.star, color: Colors.amberAccent),
          const SizedBox(width: 8),
          Text('${model.score}', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(width: 18),
          Text('High: ${model.highScore}', style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ]),
      ),
    ]);
  }
}

// ---------------------------
// Control buttons (mobile)
// ---------------------------
class ControlButtons extends StatelessWidget {
  final VoidCallback onLeft, onRight, onJump;
  const ControlButtons({required this.onLeft, required this.onRight, required this.onJump, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      _ControlButton(icon: Icons.arrow_back, onTap: onLeft),
      const SizedBox(width: 8),
      _ControlButton(icon: Icons.arrow_upward, onTap: onJump),
      const SizedBox(width: 8),
      _ControlButton(icon: Icons.arrow_forward, onTap: onRight),
    ]);
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}

// ---------------------------
// Overlays
// ---------------------------
class MenuOverlay extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onHowToPlay;
  const MenuOverlay({required this.onStart, required this.onHowToPlay, super.key});
  @override
  Widget build(BuildContext context) {
    final GameModel gameModel = context.watch<GameModel>(); // Watch for volume changes
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            color: Colors.black87.withOpacity(0.65),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const Text('Adventure Run', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('A short adventure — side-scroller, natural style', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: onStart,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Adventure'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(220, 48)),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: onHowToPlay,
                  icon: const Icon(Icons.info_outline),
                  label: const Text('How to play'),
                ),
                const SizedBox(height: 20), // Add space for volume
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.volume_down, color: Colors.white70),
                    Expanded(
                      child: Slider(
                        value: gameModel.globalVolume,
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        label: '${(gameModel.globalVolume * 100).round()}%',
                        onChanged: (double value) {
                          gameModel.setGlobalVolume(value);
                        },
                        activeColor: Colors.orangeAccent,
                        inactiveColor: Colors.white38,
                      ),
                    ),
                    const Icon(Icons.volume_up, color: Colors.white70),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class PauseOverlay extends StatelessWidget {
  final VoidCallback onResume;
  final VoidCallback onQuit;
  const PauseOverlay({required this.onResume, required this.onQuit, super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: Card(
            color: Colors.black87.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: <Widget>[
                const Text('PAUSED', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 18),
                ElevatedButton(onPressed: onResume, child: const Text('Resume')),
                const SizedBox(height: 8),
                TextButton(onPressed: onQuit, child: const Text('Quit to Menu')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class GameOverOverlay extends StatelessWidget {
  final int score;
  final int highScore;
  final VoidCallback onRestart;
  final VoidCallback onMenu;
  const GameOverOverlay({required this.score, required this.highScore, required this.onRestart, required this.onMenu, super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            color: Colors.black87.withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: <Widget>[
                const Text('GAME OVER', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('Score: $score', style: const TextStyle(color: Colors.amber, fontSize: 20)),
                const SizedBox(height: 6),
                Text('High: $highScore', style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 14),
                ElevatedButton(onPressed: onRestart, child: const Text('Play Again')),
                const SizedBox(height: 8),
                TextButton(onPressed: onMenu, child: const Text('Back to Menu')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class HowToPlayOverlay extends StatelessWidget {
  final VoidCallback onBackToMenu;
  const HowToPlayOverlay({required this.onBackToMenu, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            color: Colors.black87.withOpacity(0.7),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const Text('How to Play', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const InstructionRow(icon: Icons.arrow_left, text: 'Move Left'),
                const InstructionRow(icon: Icons.arrow_right, text: 'Move Right'),
                const InstructionRow(icon: Icons.arrow_upward, text: 'Jump (Tap or W)'),
                const InstructionRow(icon: Icons.space_bar, text: 'Jump (Space Bar)'),
                const InstructionRow(icon: Icons.pause, text: 'Pause (P)'),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: onBackToMenu,
                  icon: const Icon(Icons.menu),
                  label: const Text('Back to Menu'),
                  style: OutlinedButton.styleFrom(minimumSize: const Size(200, 40)),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class InstructionRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const InstructionRow({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}