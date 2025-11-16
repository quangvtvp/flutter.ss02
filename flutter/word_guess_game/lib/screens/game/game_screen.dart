import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/game_session_controller.dart';
import '../../managers/settings_controller.dart';
import '../../widgets/letter_tile.dart';
import '../leaderboard/leaderboard_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int? _handledRunId;
  bool _dialogVisible = false;
  bool _submittingScore = false;
  bool _leaderboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF38BDF8), Color(0xFF0EA5E9)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Consumer<GameSessionController>(
              builder: (context, gameSession, _) {
                _handlePostGameFlow(context, gameSession, settings);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Header(
                      secondsRemaining: gameSession.secondsRemaining,
                      score: gameSession.score,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Sắp xếp các chữ cái tiếng Việt trong 30 giây để ghi điểm.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _GuessDisplay(
                      pattern: gameSession.displayPattern,
                      guess: gameSession.displayGuess,
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      alignment: WrapAlignment.center,
                      children: [
                        for (
                          var i = 0;
                          i < gameSession.scrambledLetters.length;
                          i++
                        )
                          LetterTile(
                            letter: gameSession.scrambledLetters[i],
                            isSelected: gameSession.isLetterSelected(i),
                            onTap: () => gameSession.selectLetter(i),
                          ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _StatusMessage(gameSession: gameSession),
                    const Spacer(),
                    if (gameSession.status == GameStatus.completed)
                      _PrimaryButton(
                        label: 'CHƠI LẠI',
                        onPressed: () => gameSession.startNewGame(),
                      )
                    else if (gameSession.status == GameStatus.failed)
                      Column(
                        children: [
                          Text(
                            'Từ đúng: ${gameSession.currentWordRaw}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _PrimaryButton(
                            label: 'THỬ LẠI',
                            onPressed: () => gameSession.startNewGame(),
                          ),
                        ],
                      )
                    else
                      TextButton(
                        onPressed: () => gameSession.resetCurrentRound(),
                        child: const Text(
                          'Chọn lại',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handlePostGameFlow(
    BuildContext context,
    GameSessionController gameSession,
    SettingsController settings,
  ) {
    if (!gameSession.awaitingScoreSubmission) {
      _dialogVisible = false;
      _submittingScore = false;
      return;
    }

    if (_handledRunId != gameSession.runId) {
      _handledRunId = gameSession.runId;
      _dialogVisible = false;
      _submittingScore = false;
    }

    if (settings.hasPlayerName) {
      if (_submittingScore) {
        return;
      }
      _submittingScore = true;
      Future<void>.microtask(() async {
        await _submitScoreWithName(settings.playerName!);
      });
      return;
    }

    if (_dialogVisible || _submittingScore) {
      return;
    }

    _dialogVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _promptForName(context, gameSession, settings);
    });
  }

  Future<void> _promptForName(
    BuildContext context,
    GameSessionController gameSession,
    SettingsController settings,
  ) async {
    if (!mounted || !gameSession.awaitingScoreSubmission) {
      _dialogVisible = false;
      return;
    }

    final controller = TextEditingController(text: settings.playerName ?? '');
    final enteredName = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Lưu điểm của bạn'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Họ và tên',
              hintText: 'Nhập tên của bạn',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Bỏ qua'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(controller.text.trim());
              },
              child: const Text('Lưu điểm'),
            ),
          ],
        );
      },
    );

    _dialogVisible = false;

    if (!mounted || enteredName == null) {
      return;
    }

    final trimmed = enteredName.trim();
    if (trimmed.isEmpty) {
      _showSnack('Tên không được để trống.', isError: true);
      return;
    }

    await settings.setPlayerName(trimmed);
    _submittingScore = true;
    await _submitScoreWithName(trimmed, showNameSavedMessage: true);
  }

  Future<void> _submitScoreWithName(
    String playerName, {
    bool showNameSavedMessage = false,
  }) async {
    if (!mounted) {
      _submittingScore = false;
      return;
    }

    final gameSession = context.read<GameSessionController>();
    final success = await gameSession.submitScore(playerName);

    if (!mounted) {
      _submittingScore = false;
      return;
    }

    _submittingScore = false;

    if (success) {
      if (showNameSavedMessage) {
        _showSnack('Đã lưu điểm cho $playerName!');
      }
      await _showLeaderboard();
    } else {
      _showSnack('Không thể lưu điểm. Vui lòng thử lại.', isError: true);
    }
  }

  void _showSnack(String message, {bool isError = false}) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : null,
      ),
    );
  }

  Future<void> _showLeaderboard() async {
    if (!mounted || _leaderboardVisible) {
      return;
    }

    _leaderboardVisible = true;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LeaderboardSheet(),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _leaderboardVisible = false;
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.secondsRemaining, required this.score});

  final int secondsRemaining;
  final int score;

  String get _timeLabel => '00:${secondsRemaining.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        Expanded(
          child: Text(
            'Điểm: $score',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.timer, color: Colors.white, size: 22),
              const SizedBox(width: 8),
              Text(
                _timeLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GuessDisplay extends StatelessWidget {
  const _GuessDisplay({required this.pattern, required this.guess});

  final List<String> pattern;
  final List<String> guess;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: List.generate(pattern.length, (index) {
          final patternChar = pattern[index];
          if (patternChar == ' ') {
            return const SizedBox(width: 24);
          }

          final displayLetter = guess[index];
          return Container(
            width: 48,
            height: 58,
            decoration: BoxDecoration(
              color: displayLetter.isEmpty
                  ? Colors.grey.shade200
                  : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade400, width: 2),
            ),
            child: Center(
              child: Text(
                displayLetter,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _StatusMessage extends StatelessWidget {
  const _StatusMessage({required this.gameSession});

  final GameSessionController gameSession;

  @override
  Widget build(BuildContext context) {
    switch (gameSession.status) {
      case GameStatus.completed:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green.shade500.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events, color: Colors.white, size: 36),
              const SizedBox(height: 8),
              Text(
                'Hoàn thành! Bạn đạt ${gameSession.score} điểm.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      case GameStatus.failed:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red.shade500.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.white, size: 36),
              SizedBox(height: 8),
              Text(
                'Bạn đã bỏ lỡ vòng này.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      case GameStatus.playing:
        return Column(
          children: [
            Text(
              'Còn ${gameSession.secondsRemaining}s • Điểm: ${gameSession.score}',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              'Chạm vào chữ cái theo đúng trật tự.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        );
    }
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0EA5E9),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
