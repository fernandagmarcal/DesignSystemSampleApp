import 'package:flutter/material.dart';
import '/DesignSystem/components/InputField/input_text_view_model.dart';
import '/App/core/coordinator/app_coordinator.dart';

class LoginViewModel extends ChangeNotifier {
  final AppCoordinator coordinator;

  // Estados dos inputs (View Model do Componente)
  late InputTextViewModel usernameVM;
  late InputTextViewModel passwordVM;

  // Estado de Carregamento/Erro da tela
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  LoginViewModel(this.coordinator) {
    // Inicialização dos ViewModels dos Inputs, com lógica de validação.
    usernameVM = InputTextViewModel(
      controller: TextEditingController(),
      placeholder: 'Nome de Usuário',
      password: false,
      validator: _validateUsername,
    );
    passwordVM = InputTextViewModel(
      controller: TextEditingController(),
      placeholder: 'Senha',
      password: true,
      validator: _validatePassword,
    );
  }

  // --- Validações de Negócio ---
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome de usuário é obrigatório.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha é obrigatória.';
    }
    if (value.length < 4) {
      return 'A senha deve ter pelo menos 4 caracteres.';
    }
    return null;
  }

  // --- Ação de Login ---
  Future<void> login() async {
    // 1. Força a validação de todos os campos e notifica a UI para exibir erros.
    final bool isUsernameValid = _validateUsername(usernameVM.controller.text) == null;
    final bool isPasswordValid = _validatePassword(passwordVM.controller.text) == null;

    if (!isUsernameValid || !isPasswordValid) {
      // Força a UI a atualizar os erros nos inputs
      usernameVM.validator!(usernameVM.controller.text);
      passwordVM.validator!(passwordVM.controller.text);
      return;
    }

    _setLoading(true);
    _clearError();

    // 2. Simulação de chamada de API/serviço de autenticação
    await Future.delayed(const Duration(seconds: 2));

    if (usernameVM.controller.text.toLowerCase() == 'harry') {
      _setLoading(false);
      // Sucesso: Acessa o Coordinator (dependência) para realizar a transição.
      coordinator.navigateToTimeline();
    } else {
      _setLoading(false);
      _setError('Credenciais inválidas. Tente "harry" como usuário e qualquer senha válida.');
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }

  @override
  void dispose() {
    // É responsabilidade do ViewModel dispor dos seus controladores.
    usernameVM.controller.dispose();
    passwordVM.controller.dispose();
    super.dispose();
  }
}