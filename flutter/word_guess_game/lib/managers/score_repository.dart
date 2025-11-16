import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ScoreEntry {
  ScoreEntry({
    required this.playerName,
    required this.score,
    required this.timestamp,
  });

  factory ScoreEntry.fromMap(Map<String, dynamic> map) {
    final rawName = map['player_name'] as String? ?? 'Người chơi';
    final rawScore = map['score'];
    final rawTimestamp = map['created_at'] as String?;

    return ScoreEntry(
      playerName: rawName,
      score: rawScore is int ? rawScore : int.tryParse('$rawScore') ?? 0,
      timestamp: rawTimestamp != null
          ? DateTime.tryParse(rawTimestamp) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  final String playerName;
  final int score;
  final DateTime timestamp;
}

class ScoreSubmissionException implements Exception {
  ScoreSubmissionException(this.message);

  final String message;

  @override
  String toString() => message;
}

class ScoreRepository extends ChangeNotifier {
  ScoreRepository(this._client);

  final SupabaseClient _client;

  final List<ScoreEntry> _scores = <ScoreEntry>[];
  bool _isLoading = false;
  String? _errorMessage;

  List<ScoreEntry> get scores => List.unmodifiable(_scores);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> refreshLeaderboard() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final List<dynamic> data = await _client
          .from('scores')
          .select('player_name, score, created_at')
          .order('score', ascending: false)
          .order('created_at', ascending: true);

      final seenPlayers = <String>{};
      final entries = <ScoreEntry>[];

      for (final item in data) {
        final record = ScoreEntry.fromMap(item as Map<String, dynamic>);
        final normalizedName = record.playerName.trim().toLowerCase();
        if (normalizedName.isEmpty) {
          continue;
        }
        if (seenPlayers.add(normalizedName)) {
          entries.add(record);
        }
      }

      _scores
        ..clear()
        ..addAll(entries);
    } on PostgrestException catch (error) {
      _errorMessage = error.message;
      debugPrint('Failed to load leaderboard: ${error.message}');
    } catch (error) {
      _errorMessage = 'Không thể tải bảng xếp hạng. Vui lòng thử lại sau.';
      debugPrint('Failed to load leaderboard: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> recordScore({
    required String playerName,
    required int score,
  }) async {
    final trimmedName = playerName.trim();
    if (trimmedName.isEmpty) {
      throw ScoreSubmissionException('Tên người chơi không được để trống.');
    }

    try {
      await _client.from('scores').insert(<String, dynamic>{
        'player_name': trimmedName,
        'score': score,
      });
      await refreshLeaderboard();
    } on PostgrestException catch (error) {
      debugPrint('Failed to record score: ${error.message}');
      throw ScoreSubmissionException(error.message);
    } catch (error) {
      debugPrint('Failed to record score: $error');
      throw ScoreSubmissionException(
        'Không thể lưu điểm. Vui lòng thử lại sau.',
      );
    }
  }
}
