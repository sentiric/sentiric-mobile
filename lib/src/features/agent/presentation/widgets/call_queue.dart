import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/core/providers/agent_workspace_provider.dart';
import 'package:sentiric_mobile/src/features/agent/domain/call.dart';

class CallQueue extends ConsumerWidget {
  const CallQueue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(agentWorkspaceProvider);
    final notifier = ref.read(agentWorkspaceProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Çağrı Kuyruğu (${state.calls.length})',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        // DÜZELTME: '...' (spread operatörü) const olmayan bir listede kullanılamaz.
        // Bu yüzden listeyi doğrudan `children`'a atıyoruz.
        for (final call in state.calls)
          Card(
            key: ValueKey(call.id), // Animasyonlar için anahtar eklemek iyidir
            color: state.activeCallId == call.id
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(call.handledBy == HandledBy.ai
                  ? Icons.computer_rounded
                  : Icons.person_rounded),
              title: Text(call.from),
              subtitle: Text(call.status.name),
              onTap: () => notifier.selectCall(call.id),
              selected: state.activeCallId == call.id,
            ),
          )
      ],
    );
  }
}
