import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/core/theme/theme_provider.dart';
// Bu sayfadaki alt bileşenlerin (CallQueue vb.) importları gerekecek.

class AgentWorkspaceScreen extends ConsumerWidget {
  const AgentWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajan Çalışma Alanı'),
        actions: [
          IconButton(
            icon: Icon(ref.watch(themeProvider) == ThemeMode.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: const Center(child: Text("Ajan kokpiti burada olacak.")),
      // Burada web-agent-ui'daki gibi 3'lü panel yapısı kurulacak.
    );
  }
}
