import 'package:go_router/go_router.dart';
import 'package:sentiric_mobile/src/features/auth/presentation/screens/role_selection_screen.dart';
import 'package:sentiric_mobile/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:sentiric_mobile/src/features/agent/presentation/screens/agent_workspace_screen.dart';
import 'package:sentiric_mobile/src/features/customer/presentation/screens/customer_portal_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/supervisor',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/agent',
      builder: (context, state) => const AgentWorkspaceScreen(),
    ),
    GoRoute(
      path: '/customer',
      builder: (context, state) => const CustomerPortalScreen(),
    ),
  ],
);
