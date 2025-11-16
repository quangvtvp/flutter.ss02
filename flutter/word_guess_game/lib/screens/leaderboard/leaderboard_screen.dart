import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/score_repository.dart';

class LeaderboardSheet extends StatefulWidget {
  const LeaderboardSheet({super.key});

  @override
  State<LeaderboardSheet> createState() => _LeaderboardSheetState();
}

class _LeaderboardSheetState extends State<LeaderboardSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final repository = context.read<ScoreRepository>();
      if (repository.scores.isEmpty && !repository.isLoading) {
        repository.refreshLeaderboard();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<ScoreRepository>();

    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bảng xếp hạng',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'Làm mới',
                        icon: const Icon(Icons.refresh),
                        onPressed: repository.isLoading
                            ? null
                            : () => repository.refreshLeaderboard(),
                      ),
                      IconButton(
                        tooltip: 'Đóng',
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: RefreshIndicator(
                onRefresh: repository.refreshLeaderboard,
                child: _buildBody(repository),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(ScoreRepository repository) {
    if (repository.isLoading && repository.scores.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (repository.errorMessage != null && repository.scores.isEmpty) {
      return _ErrorState(
        message: repository.errorMessage!,
        onRetry: repository.refreshLeaderboard,
      );
    }

    if (repository.scores.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          const Icon(Icons.emoji_events, size: 72, color: Colors.amber),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Chưa có lượt chơi nào.\nHãy là người đầu tiên lên bảng vàng!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: repository.scores.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final entry = repository.scores[index];
        return _LeaderboardTile(
          rank: index + 1,
          playerName: entry.playerName,
          score: entry.score,
          submittedAt: entry.timestamp,
        );
      },
    );
  }
}

class _LeaderboardTile extends StatelessWidget {
  const _LeaderboardTile({
    required this.rank,
    required this.playerName,
    required this.score,
    required this.submittedAt,
  });

  final int rank;
  final String playerName;
  final int score;
  final DateTime submittedAt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTopThree = rank <= 3;
    final accentColors = <Color>[Colors.amber, Colors.grey, Colors.brown];

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: isTopThree
              ? accentColors[rank - 1]
              : theme.colorScheme.primary,
          child: Text(
            '$rank',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          playerName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(_formatTimestamp(submittedAt)),
        trailing: Text(
          '$score',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now().toUtc();
    final submitted = timestamp.toUtc();
    final delta = now.difference(submitted);

    if (delta.inMinutes < 1) {
      return 'Vừa ghi điểm';
    }
    if (delta.inMinutes < 60) {
      return '${delta.inMinutes} phút trước';
    }
    if (delta.inHours < 24) {
      return '${delta.inHours} giờ trước';
    }
    if (delta.inDays < 7) {
      return '${delta.inDays} ngày trước';
    }
    return '${submitted.day}/${submitted.month}/${submitted.year}';
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        const Icon(Icons.wifi_off, size: 72, color: Colors.redAccent),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
