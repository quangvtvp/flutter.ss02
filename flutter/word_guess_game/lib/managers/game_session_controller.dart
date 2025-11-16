import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'audio_controller.dart';
import 'games_services_controller.dart';
import 'gemini_model.dart';
import 'score_repository.dart';
import 'word_prompt_service.dart';

enum GameStatus { playing, completed, failed }

/// Holds the core gameplay state following the Casual Games Toolkit structure.
class GameSessionController extends ChangeNotifier {
  GameSessionController({
    required AudioController audioController,
    required GamesServicesController gamesServicesController,
    required ScoreRepository scoreRepository,
    required WordPromptService wordPromptService,
  }) : _audioController = audioController,
       _gamesServicesController = gamesServicesController,
       _scoreRepository = scoreRepository,
       _wordPromptService = wordPromptService {
    _wordPool = List<String>.from(_defaultWords);
  }

  static const int _roundDurationSeconds = 30;
  static const List<String> _defaultWords = [
    'MÙA XUÂN',
    'MÙA HẠ',
    'MÙA THU',
    'MÙA ĐÔNG',
    'GIA ĐÌNH',
    'BẠN BÈ',
    'HẠNH PHÚC',
    'SỨC KHỎE',
    'BÌNH YÊN',
    'TÌNH YÊU',
    'HY VỌNG',
    'ƯỚC MƠ',
    'THÀNH CÔNG',
    'NIỀM VUI',
    'NỖI BUỒN',
    'TỰ DO',
    'CÔNG LÝ',
    'ĐAM MÊ',
    'SÁNG TẠO',
    'KIÊN NHẪN',
    'DŨNG CẢM',
    'TRUNG THỰC',
    'KHIÊM TỐN',
    'TÔN TRỌNG',
    'BIẾT ƠN',
    'THIÊN NHIÊN',
    'BẦU TRỜI',
    'MẶT TRỜI',
    'MẶT TRĂNG',
    'NGÔI SAO',
    'DÒNG SÔNG',
    'NGỌN NÚI',
    'BIỂN CẢ',
    'KHU RỪNG',
    'HOA SEN',
    'CÂY TRE',
    'QUÊ HƯƠNG',
    'TỔ QUỐC',
    'LỊCH SỬ',
    'VĂN HÓA',
    'ÂM NHẠC',
    'HỘI HỌA',
    'THI CA',
    'ẨM THỰC',
    'DU LỊCH',
    'KHOA HỌC',
    'CÔNG NGHỆ',
    'TƯƠNG LAI',
    'QUÁ KHỨ',
    'HIỆN TẠI',
  ];

  final AudioController _audioController;
  final GamesServicesController _gamesServicesController;
  final Random _random = Random();
  final ScoreRepository _scoreRepository;
  final WordPromptService _wordPromptService;

  late List<String> _wordPool;
  String _currentWordRaw = '';
  String _currentWordNormalized = '';
  List<String> _scrambledLetters = <String>[];

  final List<int> _selectedLetterIndices = [];
  Timer? _roundTimer;

  GameStatus _status = GameStatus.playing;
  int _currentWordIndex = 0;
  int _score = 0;
  int _secondsRemaining = _roundDurationSeconds;
  int _runId = 0;
  bool _awaitingScoreSubmission = false;
  bool _isInitializing = false;

  GameStatus get status => _status;
  int get score => _score;
  int get secondsRemaining => _secondsRemaining;
  String get currentWordRaw => _currentWordRaw;
  List<String> get scrambledLetters => List.unmodifiable(_scrambledLetters);
  List<String> get currentGuess =>
      _selectedLetterIndices.map((index) => _scrambledLetters[index]).toList();
  int get runId => _runId;
  bool get awaitingScoreSubmission => _awaitingScoreSubmission;
  bool get isInitializing => _isInitializing;
  GeminiModel get activeGeminiModel => _wordPromptService.model;

  List<String> get displayPattern =>
      _currentWordRaw.isEmpty ? <String>[] : _currentWordRaw.split('');
  List<String> get displayGuess {
    final guess = currentGuess;
    var guessPointer = 0;
    final pattern = displayPattern;
    return pattern.map((char) {
      if (char == ' ') {
        return ' ';
      }
      if (guessPointer < guess.length) {
        return guess[guessPointer++];
      }
      return '';
    }).toList();
  }

  bool isLetterSelected(int index) => _selectedLetterIndices.contains(index);

  Future<void> startNewGame({bool randomizeOrder = true}) async {
    if (_isInitializing) {
      return;
    }

    _stopTimer();
    _selectedLetterIndices.clear();
    _currentWordRaw = '';
    _currentWordNormalized = '';
    _scrambledLetters = <String>[];
    _score = 0;
    _status = GameStatus.playing;
    _awaitingScoreSubmission = false;
    _secondsRemaining = _roundDurationSeconds;
    _runId += 1;
    final shouldFetchRemoteWords = _wordPromptService.hasValidApiKey;

    if (shouldFetchRemoteWords) {
      _isInitializing = true;
      notifyListeners();
      try {
        await _refreshWordPool(randomizeOrder: randomizeOrder);
      } catch (error, stackTrace) {
        debugPrint('Failed to fetch Gemini word list: $error');
        debugPrintStack(stackTrace: stackTrace);
        _applyFallbackWordPool(randomizeOrder: randomizeOrder);
      } finally {
        _isInitializing = false;
      }
    } else {
      _applyFallbackWordPool(randomizeOrder: randomizeOrder);
    }

    _currentWordIndex = 0;
    _prepareCurrentWord();
  }

  Future<void> _refreshWordPool({required bool randomizeOrder}) async {
    final generatedWords = await _wordPromptService.fetchWordList();
    final normalized = <String>[];
    final seen = <String>{};

    for (final word in generatedWords) {
      final cleaned = word.replaceAll(RegExp(r'\s+'), ' ').trim().toUpperCase();
      if (cleaned.isEmpty) {
        continue;
      }
      if (seen.add(cleaned)) {
        normalized.add(cleaned);
      }
      if (normalized.length >= 50) {
        break;
      }
    }

    if (normalized.isNotEmpty) {
      _wordPool = normalized;
      if (randomizeOrder && _wordPool.length > 1) {
        _wordPool.shuffle(_random);
      }
    } else {
      _applyFallbackWordPool(randomizeOrder: randomizeOrder);
    }
  }

  void _applyFallbackWordPool({required bool randomizeOrder}) {
    _wordPool = List<String>.from(_defaultWords);
    if (randomizeOrder && _wordPool.length > 1) {
      _wordPool.shuffle(_random);
    }
  }

  void selectGeminiModel(GeminiModel model) {
    _wordPromptService.selectModel(model);
  }

  void _prepareCurrentWord() {
    if (_wordPool.isEmpty) {
      _status = GameStatus.failed;
      _awaitingScoreSubmission = false;
      _scrambledLetters = <String>[];
      _currentWordRaw = '';
      _currentWordNormalized = '';
      _secondsRemaining = 0;
      notifyListeners();
      return;
    }

    _stopTimer();
    _selectedLetterIndices.clear();
    _currentWordRaw = _wordPool[_currentWordIndex].toUpperCase();
    _currentWordNormalized = _currentWordRaw.replaceAll(' ', '');
    _scrambledLetters = _currentWordNormalized.split('');

    if (_scrambledLetters.length > 1) {
      do {
        _scrambledLetters.shuffle(_random);
      } while (_scrambledLetters.join() == _currentWordNormalized &&
          _scrambledLetters.toSet().length > 1);
    }

    _secondsRemaining = _roundDurationSeconds;
    notifyListeners();
    _startTimer();
  }

  void _startTimer() {
    _roundTimer?.cancel();
    _roundTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_status != GameStatus.playing) {
        timer.cancel();
        return;
      }

      if (_secondsRemaining <= 1) {
        timer.cancel();
        _secondsRemaining = 0;
        notifyListeners();
        _handleRoundFailure();
      } else {
        _secondsRemaining -= 1;
        notifyListeners();
      }
    });
  }

  Future<void> selectLetter(int index) async {
    if (_status != GameStatus.playing ||
        _isInitializing ||
        _selectedLetterIndices.contains(index)) {
      return;
    }

    _selectedLetterIndices.add(index);
    notifyListeners();
    await _audioController.playTap();

    if (_selectedLetterIndices.length == _currentWordNormalized.length) {
      final guessed = currentGuess.join();
      if (guessed == _currentWordNormalized) {
        await _handleRoundSuccess();
      } else {
        _handleRoundFailure();
      }
    }
  }

  Future<void> _handleRoundSuccess() async {
    if (_status != GameStatus.playing) return;

    _score += 1;
    _stopTimer();
    notifyListeners();
    await _audioController.playCorrect();
    await _gamesServicesController.reportScore(_score);

    final hasMoreWords = _currentWordIndex < _wordPool.length - 1;
    if (!hasMoreWords) {
      _status = GameStatus.completed;
      _awaitingScoreSubmission = true;
      notifyListeners();
      await _gamesServicesController.reportWin();
      return;
    }

    _currentWordIndex += 1;
    _status = GameStatus.playing;
    _prepareCurrentWord();
  }

  void _handleRoundFailure() {
    if (_status != GameStatus.playing) return;

    _status = GameStatus.failed;
    _awaitingScoreSubmission = true;
    _stopTimer();
    notifyListeners();

    () async {
      await _audioController.playIncorrect();
      await _gamesServicesController.reportScore(_score);
    }();
  }

  void resetCurrentRound() {
    if (_status != GameStatus.playing || _isInitializing) return;
    _selectedLetterIndices.clear();
    notifyListeners();
  }

  Future<bool> submitScore(String playerName) async {
    if (!_awaitingScoreSubmission) {
      return false;
    }

    try {
      await _scoreRepository.recordScore(playerName: playerName, score: _score);
      _awaitingScoreSubmission = false;
      notifyListeners();
      return true;
    } on ScoreSubmissionException catch (error) {
      debugPrint('Score submission failed: ${error.message}');
      return false;
    } catch (error) {
      debugPrint('Score submission failed: $error');
      return false;
    }
  }

  void _stopTimer() {
    _roundTimer?.cancel();
    _roundTimer = null;
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
