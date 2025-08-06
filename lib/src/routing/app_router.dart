import 'package:go_router/go_router.dart';
import 'package:sentiric_mobile/src/features/auth/presentation/screens/login_screen.dart';
import 'package:sentiric_mobile/src/features/dashboard/presentation/screens/dashboard_screen.dart';

// GoRouter ile modern ve güvenli bir yönlendirme
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
