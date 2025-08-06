import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/core/theme/theme_provider.dart';

class CustomerPortalScreen extends ConsumerWidget {
  const CustomerPortalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müşteri Portalı'), // Tenant'a göre dinamik olabilir
        actions: [
          IconButton(
            icon: const Icon(Icons.mic_rounded),
            onPressed: () {/* Click-to-Talk başlat */},
            tooltip: 'Destek ile Görüş',
          ),
          IconButton(
            icon: Icon(ref.watch(themeProvider) == ThemeMode.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Hoş Geldiniz, Azmi Bey',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          // Örnek kartlar
          Card(
            child: ListTile(
              leading: const Icon(Icons.history_rounded),
              title: const Text('Görüşme Geçmişi'),
              subtitle: const Text('Önceki tüm transkriptleriniz'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: const Text('Siparişlerim'),
              subtitle: const Text('Sipariş durumunuzu kontrol edin'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
