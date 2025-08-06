import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentiric_mobile/src/core/theme/theme_provider.dart';
import 'package:sentiric_mobile/src/routing/app_router.dart';

class SentiricApp extends ConsumerWidget {
  const SentiricApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Sentiric Mobile',
      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade50,
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),

      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        useMaterial3: true,
      ),

      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
