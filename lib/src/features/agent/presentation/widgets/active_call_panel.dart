import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/core/providers/agent_workspace_provider.dart';
import 'package:sentiric_mobile/src/features/agent/domain/call.dart';

class ActiveCallPanel extends ConsumerWidget {
  const ActiveCallPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch ile state'i dinliyoruz, değişiklik olduğunda bu widget yeniden çizilecek.
    final activeCall = ref.watch(agentWorkspaceProvider).activeCall;

    if (activeCall == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Aktif çağrı yok. Kuyruktan bir çağrı seçin.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aktif Görüşme', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Müşteri: ${activeCall.from}',
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

          // Duruma göre doğru kontrol panelini göster
          if (activeCall.handledBy == HandledBy.ai)
            _AiControls(callId: activeCall.id)
          else
            const _AgentControls(),
        ],
      ),
    );
  }
}

// AI kontrol butonları için ayrı bir widget
class _AiControls extends ConsumerWidget {
  final String callId;
  const _AiControls({required this.callId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(agentWorkspaceProvider.notifier);

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "AI'ya fısılda...",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          icon:
              const Icon(Icons.switch_account_rounded), // DÜZELTME: Doğru ikon
          label: const Text('Devral'),
          onPressed: () => notifier.takeOverCall(callId),
        ),
      ],
    );
  }
}

// Ajan kontrol butonları için ayrı bir widget
class _AgentControls extends StatelessWidget {
  const _AgentControls();

  @override
  Widget build(BuildContext context) {
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
