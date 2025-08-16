import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/features/agent/domain/call.dart';

// Bu, sahte verilerle dolu başlangıç durumumuz.
final _initialCalls = [
  Call(
      id: 'call-123',
      from: '+90 555 123 4567',
      status: CallStatus.ringing,
      handledBy: HandledBy.ai),
  Call(
      id: 'call-456',
      from: '+90 555 987 6543',
      status: CallStatus.ringing,
      handledBy: HandledBy.ai),
];

// AgentWorkspace'in tüm durumunu yöneten sınıf.
class AgentWorkspaceState {
  final List<Call> calls;
  final String? activeCallId;
  final List<TranscriptLine> transcript;

  AgentWorkspaceState({
    required this.calls,
    this.activeCallId,
    this.transcript = const [],
  });

  Call? get activeCall => activeCallId != null
      ? calls.firstWhere((c) => c.id == activeCallId)
      : null;

  AgentWorkspaceState copyWith(
      {List<Call>? calls,
      String? activeCallId,
      List<TranscriptLine>? transcript}) {
    return AgentWorkspaceState(
      calls: calls ?? this.calls,
      activeCallId: activeCallId ?? this.activeCallId,
      transcript: transcript ?? this.transcript,
    );
  }
}

// State'i değiştiren mantığı içeren Notifier.
class AgentWorkspaceNotifier extends StateNotifier<AgentWorkspaceState> {
  AgentWorkspaceNotifier() : super(AgentWorkspaceState(calls: _initialCalls));

  void selectCall(String callId) {
    // Çağrı seçildiğinde, sahte bir transkript simülasyonu başlat
    state = state.copyWith(activeCallId: callId, transcript: []);
    _simulateTranscript(callId);
  }

  void takeOverCall(String callId) {
    state = state.copyWith(
      calls: state.calls.map((c) {
        return c.id == callId ? c.copyWith(handledBy: HandledBy.agent) : c;
      }).toList(),
    );
  }

  void _simulateTranscript(String callId) {
    // ... (web-agent-ui'daki gibi transkript simülasyon mantığı)
  }
}

// Uygulamanın her yerinden bu state'e erişmemizi sağlayan provider.
final agentWorkspaceProvider =
    StateNotifierProvider<AgentWorkspaceNotifier, AgentWorkspaceState>((ref) {
  return AgentWorkspaceNotifier();
});
