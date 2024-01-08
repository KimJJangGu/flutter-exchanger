import 'package:exchanger/presenter/exchange_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final routes = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (_, __) {
      ChangeNotifierProvider(
        create: (_) {},
        child: const ExchangeScreen(),
      );
    },
  )
]);
