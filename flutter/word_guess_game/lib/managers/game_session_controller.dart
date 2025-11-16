import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'audio_controller.dart';
import 'games_services_controller.dart';
import 'score_repository.dart';

enum GameStatus { playing, completed, failed }

/// Holds the core gameplay state following the Casual Games Toolkit structure.
class GameSessionController extends ChangeNotifier {
  GameSessionController({
    required AudioController audioController,
    required GamesServicesController gamesServicesController,
    required ScoreRepository scoreRepository,
  }) : _audioController = audioController,
       _gamesServicesController = gamesServicesController,
       _scoreRepository = scoreRepository {
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

  late List<String> _wordPool;
  late String _currentWordRaw;
  late String _currentWordNormalized;
  late List<String> _scrambledLetters;

  final List<int> _selectedLetterIndices = [];
  Timer? _roundTimer;

  GameStatus _status = GameStatus.playing;
  int _currentWordIndex = 0;
  int _score = 0;
  int _secondsRemaining = _roundDurationSeconds;
  int _runId = 0;
  bool _awaitingScoreSubmission = false;

  GameStatus get status => _status;
  int get score => _score;
  int get secondsRemaining => _secondsRemaining;
  String get currentWordRaw => _currentWordRaw;
  List<String> get scrambledLetters => List.unmodifiable(_scrambledLetters);
  List<String> get currentGuess =>
      _selectedLetterIndices.map((index) => _scrambledLetters[index]).toList();
  int get runId => _runId;
  bool get awaitingScoreSubmission => _awaitingScoreSubmission;

  List<String> get displayPattern => _currentWordRaw.split('');
  List<String> get displayGuess {
    final guess = currentGuess;
    var guessPointer = 0;
    return displayPattern.map((char) {
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

  void startNewGame({bool randomizeOrder = true}) {
    _stopTimer();
    _wordPool = List<String>.from(_defaultWords);
    if (randomizeOrder) {
      _wordPool.shuffle(_random);
    }
    _currentWordIndex = 0;
    _score = 0;
    _status = GameStatus.playing;
    _awaitingScoreSubmission = false;
    _runId += 1;
    _prepareCurrentWord();
  }

  void _prepareCurrentWord() {
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
    if (_status != GameStatus.playing) return;
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
