import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/core/theme/theme_provider.dart';

class AppLayout extends ConsumerWidget {
  final String title;
  final Widget mobileBody;
  final Widget desktopBody;

  const AppLayout({
    super.key,
    required this.title,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(ref.watch(themeProvider) == ThemeMode.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            tooltip: 'Temayı Değiştir',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            // Kırılma noktasını 800px olarak ayarlayalım
            return mobileBody;
          } else {
            return desktopBody;
          }
        },
      ),
    );
  }
}
