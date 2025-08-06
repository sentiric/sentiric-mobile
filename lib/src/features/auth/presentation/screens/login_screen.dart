import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo (assets/ klasörü oluşturulmalı)
            // Image.asset('assets/sentiric-logo.svg', width: 200),
            const SizedBox(height: 40),
            Text(
              'Ajan Arayüzüne Giriş',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Giriş Yap (Simülasyon)'),
            ),
          ],
        ),
      ),
    );
  }
}
