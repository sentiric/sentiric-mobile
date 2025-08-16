import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SVG kullanımı için
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema rengine göre logo seçimi
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDarkMode
        ? 'assets/sentiric-logo-monochrome.svg'
        : 'assets/sentiric-logo.svg';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(logoAsset, height: 40),
              const SizedBox(height: 48),
              Text(
                'Platforma Giriş Yapın',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              // Email and Password fields would go here
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                child: const Text('Giriş Yap (Simülasyon)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
