import 'package:go_router/go_router.dart';
import '../pages/pages.dart';

/// Routes para la feature agentops_console
/// Se registran en la aplicación principal mediante spread operator en routes globales
final List<GoRoute> agentopsConsoleRoutes = [
  GoRoute(
    name: HomePage.name,
    path: HomePage.path,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    name: AgentsPage.name,
    path: AgentsPage.path,
    builder: (context, state) => const AgentsPage(),
  ),
  GoRoute(
    name: ContextBasePage.name,
    path: ContextBasePage.path,
    builder: (context, state) => const ContextBasePage(),
  ),
  GoRoute(
    name: RunStudioPage.name,
    path: RunStudioPage.path,
    builder: (context, state) => const RunStudioPage(),
  ),
  GoRoute(
    name: RunHistoryPage.name,
    path: RunHistoryPage.path,
    builder: (context, state) => const RunHistoryPage(),
  ),
];
