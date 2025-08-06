import 'package:flutter/material.dart';

class ActiveCallPanel extends StatelessWidget {
  const ActiveCallPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aktif Görüşme', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Müşteri: +90 555 123 4567',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Konuşma transkripti...')),
            ),
          ),
          const SizedBox(height: 16),
          const _CallControls(),
        ],
      ),
    );
  }
}

class _CallControls extends StatelessWidget {
  const _CallControls();

  @override
  Widget build(BuildContext context) {
    // DÜZELTME: Deprecated 'surfaceVariant' yerine modern renkleri kullan
    final buttonBackgroundColor =
        Theme.of(context).colorScheme.surfaceContainerHighest;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.call_end),
            style:
                IconButton.styleFrom(backgroundColor: Colors.red, iconSize: 28),
            padding: const EdgeInsets.all(16)),
        const SizedBox(width: 16),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_off),
            style: IconButton.styleFrom(
                backgroundColor: buttonBackgroundColor, iconSize: 24),
            padding: const EdgeInsets.all(12)),
        const SizedBox(width: 16),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.pause),
            style: IconButton.styleFrom(
                backgroundColor: buttonBackgroundColor, iconSize: 24),
            padding: const EdgeInsets.all(12)),
      ],
    );
  }
}
