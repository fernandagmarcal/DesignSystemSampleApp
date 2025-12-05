import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/App/core/coordinator/app_coordinator.dart';
import '../login/login_view_model.dart';
import '/DesignSystem/shared/shared_colors.dart';
import '/DesignSystem/components/InputField/input_text.dart';
import '/DesignSystem/components/buttons/ActionButton/action_button.dart';
import '/DesignSystem/components/buttons/ActionButton/action_button_view_model.dart';


class LoginView extends StatelessWidget {
  final AppCoordinator coordinator;

  const LoginView._({required this.coordinator});

  // Método estático para instanciar a View e o ViewModel via Provider
  // O Coordinator chama este método na geração de rotas.
  static Widget instantiate(AppCoordinator coordinator) {
    return ChangeNotifierProvider(
      // Cria o ViewModel, passando o Coordinator como dependência.
      create: (_) => LoginViewModel(coordinator),
      child: LoginView._(coordinator: coordinator),
    );
  }

  @override
  Widget build(BuildContext context) {
    // A View obtém o ViewModel do Provider
    final vm = context.watch<LoginViewModel>();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Título HP usando as cores temáticas
              Text(
                'Mundo Mágico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: marromClaro,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Input de Usuário (Reuso do componente de DS)
              StyledInputField.instantiate(viewModel: vm.usernameVM),
              const SizedBox(height: 16),

              // Input de Senha (Reuso do componente de DS)
              StyledInputField.instantiate(viewModel: vm.passwordVM),
              const SizedBox(height: 24),

              // Mensagem de Erro
              if (vm.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    vm.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: grifinoriaColor, fontWeight: FontWeight.bold),
                  ),
                ),

              // Botão de Login (USANDO ActionButton)
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  text: vm.isLoading ? 'Autenticando...' : 'Entrar em Hogwarts',
                  // Se estiver carregando, passamos uma função vazia para desabilitar o botão.
                  onPressed: vm.isLoading ? () {} : vm.login,
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  iconPosition: IconPosition.none,
                ),
              ),

              // Indicador de progresso flutuante
              if (vm.isLoading)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: marromClaro,
                        backgroundColor: azulEscuro,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}