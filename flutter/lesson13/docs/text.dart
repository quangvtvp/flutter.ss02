// main.dart
// Wuxia Fighter — Single-file Flutter + Flame prototype
//
// Features:
//  - Main menu, character select, stage select
//  - Local 2-player controls + simple AI
//  - HUD, health bars, particles (additive glow), simple animations
//  - Background music & SFX via FlameAudio (files must be in assets/audio/)
//  - Fallback procedural visuals if assets missing
//
// How to use:
//  1) Put this file at lib/main.dart (replace existing).
//  2) Ensure pubspec.yaml includes flame, flame_audio, google_fonts and the assets listed.
//  3) Place assets under assets/... folders as described in README comments above.
//  4) flutter pub get && flutter run
//
// Notes:
//  - This is a prototype: extend by replacing placeholders with better art and adding more states/animations.
//  - Keep audio levels low for pleasant experience.
//
// Author: ChatGPT (adapted code)

import 'dart:ui';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:google_fonts/google_fonts.dart';

// Entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Preload audio (placeholders)
  try {
    await FlameAudio.audioCache.loadAll([
      'bgm_wuxia.mp3',
      'sfx_slash.wav',
      'sfx_hit.wav',
    ]);
  } catch (e) {
    // ignore—missing assets will be handled gracefully
    print('Audio preload: $e');
  }
  runApp(const WuxiaApp());
}

class WuxiaApp extends StatelessWidget {
  const WuxiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wuxia Fighter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSerifTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF031322),
      ),
      home: const RootScreen(),
    );
  }
}

// RootScreen controls menu / selection / game widget
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

enum ScreenState { menu, select, playing }

class _RootScreenState extends State<RootScreen> {
  ScreenState _state = ScreenState.menu;

  // selection defaults
  int selP1 = 0;
  int selP2 = 1;
  int selStage = 0;
  bool p2IsAI = false;

  // asset paths (match pubspec.yaml)
  final List<String> characterPaths = [
    'assets/characters/char_swordsman.png',
    'assets/characters/char_spear.png',
    'assets/characters/char_assassin.png',
  ];
  final List<String> stagePaths = [
    'assets/images/bg_stage_mountain.png',
    'assets/images/bg_stage_garden.png',
  ];

  // game instance
  WuxiaGame? game;

  @override
  Widget build(BuildContext context) {
    switch (_state) {
      case ScreenState.menu:
        return _buildMenu(context);
      case ScreenState.select:
        return _buildSelect(context);
      case ScreenState.playing:
        return _buildGame(context);
    }
  }

  Widget _buildMenu(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background - try asset, fallback gradient + moon
          Positioned.fill(child: _buildBackgroundPreview(selStage)),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('武侠之战',
                    style: TextStyle(
                      fontSize: 62,
                      color: Colors.white,
                      shadows: const [Shadow(blurRadius: 12, color: Colors.black, offset: Offset(0, 6))],
                      fontFamily: GoogleFonts.notoSerif().fontFamily,
                    )),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      game = WuxiaGame(
                        p1Index: selP1,
                        p2Index: selP2,
                        stageIndex: selStage,
                        p2IsAI: p2IsAI,
                        onExit: _onGameExit,
                      );
                      _state = ScreenState.playing;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade700, padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12)),
                  child: const Text('Start', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () => setState(() => _state = ScreenState.select),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800),
                    child: const Text('Choose Character / Stage')),
                const SizedBox(height: 12),
                Text('Tip: P1 keys = A/D left-right, W jump, J attack • P2 = ←/→, ↑ jump, L attack', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Positioned(bottom: 18, right: 18, child: _buildFooterButtons()),
        ],
      ),
    );
  }

  Widget _buildBackgroundPreview(int stageIdx) {
    return FutureBuilder<dynamic>(
      future: _tryLoadImage(stagePaths[stageIdx]),
      builder: (context, snap) {
        if (snap.hasData && snap.data != null) {
          return Image.asset(stagePaths[stageIdx], fit: BoxFit.cover);
        } else {
          // fallback gradient + moon
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF04182A), Color(0xFF031422)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: CustomPaint(
              painter: _MoonPainter(),
            ),
          );
        }
      },
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              // settings dialog
              showDialog(context: context, builder: (_) => _SettingsDialog());
            },
            icon: const Icon(Icons.settings, color: Colors.white70)),
        IconButton(
            onPressed: () {
              // quick toggle AI
              setState(() => p2IsAI = !p2IsAI);
            },
            icon: Icon(p2IsAI ? Icons.robot : Icons.person, color: Colors.white70)),
      ],
    );
  }

  Widget _buildSelect(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Characters & Stage'),
        backgroundColor: const Color(0xFF071827),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCharColumn('Player 1', selP1, (i) => setState(() => selP1 = i)),
                _buildCharColumn('Player 2', selP2, (i) => setState(() => selP2 = i)),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(),
            const SizedBox(height: 8),
            Text('Select Stage', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: List.generate(stagePaths.length, (i) {
                return GestureDetector(
                    onTap: () => setState(() => selStage = i),
                    child: Stack(
                      children: [
                        Container(
                          width: 260,
                          height: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black12),
                          child: FutureBuilder<dynamic>(
                            future: _tryLoadImage(stagePaths[i]),
                            builder: (context, snap) {
                              if (snap.hasData && snap.data != null) {
                                return ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(stagePaths[i], fit: BoxFit.cover));
                              } else {
                                return Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black26),
                                  child: Center(child: Text('Stage ${i + 1}', style: TextStyle(color: Colors.white60))),
                                );
                              }
                            },
                          ),
                        ),
                        if (selStage == i)
                          Positioned.fill(
                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.yellowAccent, width: 4))))
                      ],
                    ));
              }),
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Checkbox(value: p2IsAI, onChanged: (v) => setState(() => p2IsAI = v ?? false)),
              const Text('Player 2 = AI', style: TextStyle(color: Colors.white70)),
            ]),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  // start game with selection
                  setState(() {
                    game = WuxiaGame(p1Index: selP1, p2Index: selP2, stageIndex: selStage, p2IsAI: p2IsAI, onExit: _onGameExit);
                    _state = ScreenState.playing;
                  });
                },
                child: const Text('Play')),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () => setState(() => _state = ScreenState.menu), child: const Text('Back to Menu')),
          ],
        ),
      ),
    );
  }

  Widget _buildCharColumn(String title, int current, Function(int) onSelect) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 18)),
        const SizedBox(height: 8),
        SizedBox(
          width: 180,
          child: Column(
            children: List.generate(characterPaths.length, (i) {
              return GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(border: Border.all(color: current == i ? Colors.yellowAccent : Colors.white12), borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      FutureBuilder<dynamic>(
                        future: _tryLoadImage(characterPaths[i]),
                        builder: (context, snap) {
                          if (snap.hasData && snap.data != null) {
                            return Image.asset(characterPaths[i], width: 64, height: 80, fit: BoxFit.contain);
                          } else {
                            return Container(width: 64, height: 80, color: Colors.white12, child: const Center(child: Icon(Icons.person)));
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Char ${i + 1}', style: const TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildGame(BuildContext context) {
    if (game == null) {
      return const Scaffold(body: Center(child: Text('Game loading...')));
    }
    return Scaffold(
      body: GameWidget(game: game!, overlayBuilderMap: {
        'PauseMenu': (context, game) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12)),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('Paused', style: TextStyle(color: Colors.white, fontSize: 22)),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: () => game.resumeGame(), child: const Text('Resume')),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: () => _exitGame(), child: const Text('Exit to Menu')),
              ]),
            ),
          );
        }
      }, initialActiveOverlays: const [])),
    );
  }

  Future<dynamic> _tryLoadImage(String path) async {
    // quick test whether asset exists by trying to load as ByteData
    try {
      await rootBundle.load(path);
      return true;
    } catch (e) {
      return null;
    }
  }

  void _exitGame() {
    // stop music and dispose game
    game?.dispose();
    setState(() {
      game = null;
      _state = ScreenState.menu;
    });
  }

  void _onGameExit() {
    // callback from game to return to menu
    _exitGame();
  }
}

// Settings dialog
class _SettingsDialog extends StatefulWidget {
  @override
  State<_SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<_SettingsDialog> {
  double vol = 0.4;

  @override
  void initState() {
    super.initState();
    try {
      vol = FlameAudio.bgm.player?.volume ?? 0.4;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Music volume'),
        Slider(
          value: vol,
          min: 0,
          max: 1,
          onChanged: (v) {
            setState(() => vol = v);
            try {
              FlameAudio.bgm.setVolume(v);
            } catch (e) {}
          },
        ),
        const SizedBox(height: 8),
        const Text('Controls: P1 = A/D move, W jump, J attack. P2 = Arrow keys + L attack.'),
      ]),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
    );
  }
}

// -----------------------------
// Game implementation (Flame)
// -----------------------------

typedef VoidCallback0 = void Function();

class WuxiaGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  final int p1Index;
  final int p2Index;
  final int stageIndex;
  final bool p2IsAI;
  final VoidCallback0? onExit;

  // components
  late FighterComponent player1;
  late FighterComponent player2;

  // hud
  late HealthBarComponent barP1;
  late HealthBarComponent barP2;

  // particles list
  final List<Particle> particles = [];

  // camera shake
  double cameraShake = 0;

  // overlay control
  bool paused = false;

  WuxiaGame({
    this.p1Index = 0,
    this.p2Index = 1,
    this.stageIndex = 0,
    this.p2IsAI = false,
    this.onExit,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(Vector2(960, 540));
    // background
    final stagePaths = ['assets/images/bg_stage_mountain.png', 'assets/images/bg_stage_garden.png'];
    try {
      final bgSprite = await loadSprite(stagePaths[stageIndex]);
      final bg = SpriteComponent(sprite: bgSprite, size: size);
      add(bg);
    } catch (e) {
      // fallback background painted in render
    }

    // play music (use FlameAudio.bgm to control)
    try {
      FlameAudio.bgm.play('bgm_wuxia.mp3', volume: 0.38);
    } catch (e) {
      print('bgm play error: $e');
    }

    // create players
    final charPaths = [
      'assets/characters/char_swordsman.png',
      'assets/characters/char_spear.png',
      'assets/characters/char_assassin.png',
    ];

    String p1Sprite = charPaths[p1Index % charPaths.length];
    String p2Sprite = charPaths[p2Index % charPaths.length];

    player1 = FighterComponent(spritePath: p1Sprite, position: Vector2(260, size.y - 160), isLeft: true, isAI: false, gameRef: this);
    player2 = FighterComponent(spritePath: p2Sprite, position: Vector2(size.x - 260, size.y - 160), isLeft: false, isAI: p2IsAI, gameRef: this);
    add(player1);
    add(player2);

    // hud
    barP1 = HealthBarComponent(player1, Vector2(24, 20));
    barP2 = HealthBarComponent(player2, Vector2(size.x - 340, 20));
    add(barP1);
    add(barP2);

    add(HudComponent(player1, player2, size));

    // ambient particles timer
    Timer.periodic(const Duration(milliseconds: 300), (t) {
      if (!mounted) t.cancel();
      spawnAmbientParticles();
    });
  }

  void spawnAmbientParticles() {
    if (particles.length > 120) return;
    if (random.nextDouble() < 0.25) {
      final x = random.nextDouble() * size.x;
      final y = size.y - 260 + random.nextDouble() * 60;
      for (var i = 0; i < 2; i++) {
        particles.add(Particle(Vector2(x + random.nextDouble() * 12 - 6, y + random.nextDouble() * 6 - 3),
            velocity: Vector2(random.nextDouble() * 20 - 10, -30 - random.nextDouble() * 30),
            life: 2.0,
            size: 3 + random.nextDouble() * 5,
            color: const Color.fromARGB(120, 255, 230, 170)));
      }
    }
  }

  final Random random = Random();

  @override
  void update(double dt) {
    if (paused) return;
    super.update(dt);
    // update particles
    for (int i = particles.length - 1; i >= 0; i--) {
      final p = particles[i];
      p.update(dt);
      if (p.lifeRemaining <= 0) particles.removeAt(i);
    }
    // camera shake decay
    cameraShake = max(0, cameraShake - 40 * dt);
  }

  @override
  void render(Canvas canvas) {
    // apply camera shake
    if (cameraShake > 0) {
      canvas.save();
      final dx = (random.nextDouble() - 0.5) * cameraShake;
      final dy = (random.nextDouble() - 0.5) * cameraShake;
      canvas.translate(dx, dy);
    }
    // fallback background if not loaded: soft gradient + moon
    super.render(canvas);

    // particles (additive)
    final paint = Paint()..blendMode = BlendMode.plus;
    for (final p in particles) {
      paint.color = p.color.withOpacity(p.lifeRemaining / p.lifeTotal);
      canvas.drawCircle(Offset(p.pos.x, p.pos.y), p.size, paint);
    }

    if (cameraShake > 0) canvas.restore();
  }

  void spawnHitEffect(Vector2 pos, {int count = 12}) {
    for (var i = 0; i < count; i++) {
      final angle = random.nextDouble() * pi * 2;
      final speed = 60 + random.nextDouble() * 180;
      particles.add(Particle(
          pos.clone(),
          velocity: Vector2(cos(angle) * speed, sin(angle) * speed - 40),
          life: 0.6 + random.nextDouble() * 0.6,
          size: 3 + random.nextDouble() * 4,
          color: const Color.fromARGB(220, 255, 200, 160)));
    }
    cameraShake = min(28, cameraShake + 8);
  }

  void onGameOver(FighterComponent winner) {
    paused = true;
    try {
      FlameAudio.bgm.stop();
    } catch (e) {}
    // overlay a basic dialog via game overlay - but we cannot access navigator here easily,
    // so call callback to root for exit
    Future.delayed(const Duration(milliseconds: 600), () {
      onExit?.call();
    });
  }

  void resumeGame() {
    paused = false;
  }

  @override
  void onDetach() {
    // Stop audio
    try {
      FlameAudio.bgm.stop();
    } catch (e) {}
    super.onDetach();
  }

  @override
  void onRemove() {
    onDetach();
    super.onRemove();
  }
}

// -------------------------------
// Particle model
// -------------------------------
class Particle {
  Vector2 pos;
  Vector2 velocity;
  double lifeRemaining;
  final double lifeTotal;
  double size;
  Color color;

  Particle(this.pos, {required this.velocity, required this.life, required this.size, required this.color})
      : lifeRemaining = life,
        lifeTotal = life;

  final double life; // lifetime

  void update(double dt) {
    lifeRemaining -= dt;
    pos += velocity * dt;
    velocity += Vector2(0, 600 * dt); // gravity
    // friction
    velocity *= 0.995;
  }
}

// -------------------------------
// Fighter component
// -------------------------------
class FighterComponent extends PositionComponent with HasGameRef<WuxiaGame>, CollisionCallbacks {
  final String spritePath;
  final bool isLeft;
  bool isAI;
  final WuxiaGame gameRef;

  double hp = 100;
  final double maxHp = 100;
  double speed = 220;
  double vy = 0;
  bool onGround = true;
  bool attacking = false;
  double attackCooldown = 0;

  Sprite? spriteImg;
  Vector2 spriteSize = Vector2(80, 120);

  FighterComponent({
    required this.spritePath,
    required Vector2 position,
    required this.isLeft,
    required this.isAI,
    required this.gameRef,
  }) : super(position: position, size: Vector2(80, 120), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      spriteImg = await gameRef.loadSprite(spritePath);
    } catch (e) {
      spriteImg = null;
    }
    // add hitbox for collision (not actually used for attack detection here)
    add(RectangleHitbox(relative: Vector2(0.5, 0.8), anchor: Anchor.bottomCenter));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // gravity & ground check
    vy += 1800 * dt;
    position.y += vy * dt;
    if (position.y >= gameRef.size.y - 80) {
      position.y = gameRef.size.y - 80;
      vy = 0;
      onGround = true;
    } else {
      onGround = false;
    }
    // cooldown
    attackCooldown = max(0, attackCooldown - dt);

    // clamp
    position.x = position.x.clamp(60.0, gameRef.size.x - 60.0);

    // AI simple
    if (isAI) {
      _aiStep(dt);
    }

    // health check
    if (hp <= 0) {
      // find winner (the other)
      final other = gameRef.children.whereType<FighterComponent>().firstWhere((c) => c != this);
      gameRef.onGameOver(other);
    }
  }

  void _aiStep(double dt) {
    final other = gameRef.children.whereType<FighterComponent>().firstWhere((c) => c != this);
    if (other.position.distanceTo(position) > 150) {
      // move toward target
      final dir = (other.position.x > position.x) ? 1 : -1;
      position.x += dir * speed * dt * 0.6;
    } else {
      // small chance to attack
      if (attackCooldown <= 0 && gameRef.random.nextDouble() < 0.01) attack();
      if (gameRef.random.nextDouble() < 0.003 && onGround) {
        vy = -520;
      }
    }
  }

  void moveLeft(double dt) {
    position.x -= speed * dt;
  }

  void moveRight(double dt) {
    position.x += speed * dt;
  }

  void jump() {
    if (onGround) {
      vy = -640;
      onGround = false;
    }
  }

  void attack() {
    if (attackCooldown > 0) return;
    attacking = true;
    attackCooldown = 0.5;
    // play sfx
    try {
      FlameAudio.play('sfx_slash.wav');
    } catch (e) {}
    // create simple hit rect in front
    final hitDx = isLeft ? -50 : 50;
    final hitCenter = Vector2(position.x + hitDx, position.y - 10);
    final hitRect = Rect.fromCenter(center: Offset(hitCenter.x, hitCenter.y), width: 80, height: 80);
    final enemies = gameRef.children.whereType<FighterComponent>().where((c) => c != this);
    for (final e in enemies) {
      final eRect = Rect.fromCenter(center: Offset(e.position.x, e.position.y - 10), width: e.size.x * 0.9, height: e.size.y * 0.8);
      if (hitRect.overlaps(eRect)) {
        e.receiveDamage(10);
        gameRef.spawnHitEffect(hitCenter, count: 18);
        try {
          FlameAudio.play('sfx_hit.wav');
        } catch (e) {}
      }
    }
    // after short time, stop attacking flag
    Future.delayed(const Duration(milliseconds: 180), () {
      attacking = false;
    });
  }

  void special() {
    if (attackCooldown > 0) return;
    attackCooldown = 1.0;
    // area damage
    final enemies = gameRef.children.whereType<FighterComponent>().where((c) => c != this);
    for (final e in enemies) {
      if ((e.position - position).length < 220) {
        e.receiveDamage(26);
      }
    }
    gameRef.spawnHitEffect(position, count: 40);
  }

  void receiveDamage(double d) {
    hp = max(0, hp - d);
    // knockback
    position.x += isLeft ? 12 : -12;
  }

  @override
  void render(Canvas canvas) {
    // draw shadow
    final shadowPaint = Paint()..color = Colors.black.withOpacity(0.14);
    canvas.drawOval(Rect.fromCenter(center: Offset(position.x, position.y + size.y * 0.45), width: size.x * 0.9, height: 14), shadowPaint);

    // draw sprite or placeholder
    if (spriteImg != null) {
      spriteImg!.renderRect(canvas, Rect.fromCenter(center: Offset(position.x, position.y - size.y * 0.02), width: size.x, height: size.y));
    } else {
      // placeholder body with gradient
      final rect = Rect.fromCenter(center: Offset(position.x, position.y - 10), width: size.x, height: size.y);
      final r = RRect.fromRectAndRadius(rect, const Radius.circular(12));
      final g = ui.Gradient.linear(rect.topLeft, rect.bottomRight, [Colors.white, const Color(0xFF071A2A)]);
      final paint = Paint()..shader = g;
      canvas.drawRRect(r, paint);
      // eyes
      final eyePaint = Paint()..color = Colors.black;
      canvas.drawRect(Rect.fromLTWH(position.x - 16, position.y - size.y * 0.35, 4, 4), eyePaint);
      canvas.drawRect(Rect.fromLTWH(position.x + 12, position.y - size.y * 0.35, 4, 4), eyePaint);
    }

    // draw small attack indicator if attacking
    if (attacking) {
      final atkPaint = Paint()..color = Colors.yellow.withOpacity(0.7);
      canvas.drawCircle(Offset(position.x + (isLeft ? -50 : 50), position.y - 10), 14, atkPaint);
    }
  }
}

// -------------------------------
// HUD & Health bars
// -------------------------------

class HealthBarComponent extends PositionComponent {
  final FighterComponent fighter;
  final Vector2 offset;

  HealthBarComponent(this.fighter, this.offset);

  @override
  Vector2 get position => offset;

  @override
  void render(Canvas canvas) {
    final bgRect = Rect.fromLTWH(offset.x, offset.y, 300, 16);
    final bgPaint = Paint()..color = Colors.white12;
    canvas.drawRRect(RRect.fromRectAndRadius(bgRect, const Radius.circular(6)), bgPaint);

    final pct = fighter.hp / fighter.maxHp;
    final fgRect = Rect.fromLTWH(offset.x + 6, offset.y + 3, (300 - 12) * pct, 10);
    final fgPaint = Paint()..color = pct > 0.5 ? const Color(0xFF46FFB3) : (pct > 0.2 ? const Color(0xFFFFD166) : const Color(0xFFFF6B6B));
    canvas.drawRRect(RRect.fromRectAndRadius(fgRect, const Radius.circular(6)), fgPaint);
  }
}

class HudComponent extends Component {
  final FighterComponent p1;
  final FighterComponent p2;
  final Vector2 screenSize;

  HudComponent(this.p1, this.p2, this.screenSize);

  @override
  void render(Canvas canvas) {
    // Title
    final textPainter = TextPainter(text: const TextSpan(text: '武侠对决', style: TextStyle(fontSize: 20, color: Colors.white)), textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, Offset(screenSize.x / 2 - textPainter.width / 2, 8));

    // HP numbers
    final p1hp = TextPainter(text: TextSpan(text: 'P1 HP: ${p1.hp.toInt()}', style: const TextStyle(color: Colors.white)), textDirection: TextDirection.ltr);
    p1hp.layout();
    p1hp.paint(canvas, Offset(24, 40));

    final p2hp = TextPainter(text: TextSpan(text: 'P2 HP: ${p2.hp.toInt()}', style: const TextStyle(color: Colors.white)), textDirection: TextDirection.ltr);
    p2hp.layout();
    p2hp.paint(canvas, Offset(screenSize.x - p2hp.width - 24, 40));
  }
}

// -------------------------------
// Input handling - global keyboard shortcuts
// -------------------------------
mixin KeyboardHandlerMix on HasGameRef<WuxiaGame> {
  // Not used directly; components read keys via RawKeyboardListener at widget level.
}

// -------------------------------
// Utilities & Painters
// -------------------------------
class _MoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grad = Paint()..shader = ui.Gradient.linear(Offset(0, 0), Offset(0, size.height), [const Color(0xFF04182A), const Color(0xFF031422)]);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), grad);
    final moonPaint = Paint()..color = Colors.white24;
    canvas.drawCircle(Offset(size.width - 160, 120), 80, moonPaint);
    final fog = Paint()..color = Colors.white10;
    canvas.drawRect(Rect.fromLTWH(0, size.height - 220, size.width, 220), fog);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
