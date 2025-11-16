import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../managers/settings_controller.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Cài đặt',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SwitchListTile.adaptive(
            value: settings.audioEnabled,
            onChanged: (_) => settings.toggleAudio(),
            title: const Text('Âm thanh'),
            secondary: const Icon(Icons.volume_up),
          ),
          SwitchListTile.adaptive(
            value: settings.vibrationEnabled,
            onChanged: (_) => settings.toggleVibration(),
            title: const Text('Rung phản hồi'),
            secondary: const Icon(Icons.vibration),
          ),
          SwitchListTile.adaptive(
            value: settings.darkMode,
            onChanged: (_) => settings.toggleTheme(),
            title: const Text('Chế độ tối'),
            secondary: const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
