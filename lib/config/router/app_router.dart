import 'package:go_router/go_router.dart';
import 'package:neri_cinema/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', name: HomeScreen.name, builder: (contex,state) => const HomeScreen()),
]);