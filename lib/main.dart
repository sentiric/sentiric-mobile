import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentiric_mobile/src/app.dart';

void main() {
  // Uygulamanın kararlı bir şekilde başlaması için
  WidgetsFlutterBinding.ensureInitialized();

  // Uygulamayı bir ProviderScope ile sararak
  // Riverpod'ın her yerde çalışmasını sağlıyoruz.
  runApp(const ProviderScope(child: SentiricApp()));
}
