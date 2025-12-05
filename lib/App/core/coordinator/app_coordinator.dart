import 'package:flutter/material.dart';
import '/App/features/login/login_view.dart';
import '/App/features/timeline/character_timeline_view.dart';
import 'package:flutter/material.dart';

// O Coordinator é responsável por todas as rotas e transições da aplicação.
class AppCoordinator {
  // Chave de navegação global para acesso ao Navigator.
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String loginRoute = '/login';
  static const String timelineRoute = '/timeline';

  void navigateToTimeline() {
    // navigator para home
    Navigator.of(AppCoordinator.navigatorKey.currentContext!).pushReplacementNamed(timelineRoute);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // O Coordinator mapeia a string da rota para a View correta e injeta a dependência
    // do próprio Coordinator na View para que ela possa pedir a próxima navegação.
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView.instantiate(AppCoordinator()));
      case timelineRoute:
        return MaterialPageRoute(builder: (_) => CharacterTimelineView.instantiate(AppCoordinator()));
      default:
      // Caso a rota não seja reconhecida
        return MaterialPageRoute(builder: (_) => _UndefinedRouteView(settings.name));
    }
  }
}

// Widget simples para rotas não definidas, usado para depuração.
class _UndefinedRouteView extends StatelessWidget {
  final String? name;
  const _UndefinedRouteView(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Erro de Navegação')),
      body: Center(
        child: Text('Rota não encontrada: $name'),
      ),
    );
  }
}