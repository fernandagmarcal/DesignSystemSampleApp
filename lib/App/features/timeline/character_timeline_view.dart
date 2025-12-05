import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/App/core/coordinator/app_coordinator.dart';
import '/App/core/api/hp_api.dart';
import '../timeline/character_timeline_view_model.dart';
import '/DesignSystem/shared/shared_colors.dart';
import '/DesignSystem/components/CharacterCard/character_card.dart';


class CharacterTimelineView extends StatelessWidget {
  final AppCoordinator coordinator;

  const CharacterTimelineView._({required this.coordinator});

  // === MÉTODO NECESSÁRIO ===
  static Widget instantiate(AppCoordinator coordinator) {
    // 1. Cria o ViewModel, passando o Coordinator e o HpApi (serviço de dados) como dependências.
    return ChangeNotifierProvider(
      create: (_) => CharacterTimelineViewModel(coordinator, apiService: HpApi())..reloadData(),
      // 2. Retorna a View envolta no Provider.
      child: CharacterTimelineView._(coordinator: coordinator),
    );
  }
  // ==========================

  @override
  Widget build(BuildContext context) {
    // ... (restante do código da UI da CharacterTimelineView)
    final vm = context.watch<CharacterTimelineViewModel>();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Personagens de Hogwarts',
          style: TextStyle(color: marromClaro),
        ),
        backgroundColor: azulEscuro,
        elevation: 0,
        actions: [
          // Botão de recarregar
          IconButton(
            icon: const Icon(Icons.refresh),
            color: marromClaro,
            onPressed: vm.state != TimelineState.loading ? vm.reloadData : null,
          ),
        ],
      ),
      body: _buildBody(context, vm),
    );
  }

  Widget _buildBody(BuildContext context, CharacterTimelineViewModel vm) {
    // ... (restante do código que renderiza Loading, Error ou Lista)
    switch (vm.state) {
      case TimelineState.loading:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: marromClaro),
              const SizedBox(height: 16),
              Text(
                'Carregando segredos do mundo bruxo...',
                style: TextStyle(color: brancoPadrao),
              ),
            ],
          ),
        );

      case TimelineState.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: grifinoriaColor),
                const SizedBox(height: 16),
                Text(
                  vm.errorMessage ?? 'Ocorreu um erro desconhecido.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: grifinoriaColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: vm.reloadData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulMedio,
                    foregroundColor: brancoPadrao,
                  ),
                  child: const Text('Tentar Novamente'),
                ),
              ],
            ),
          ),
        );

      case TimelineState.loaded:
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          itemCount: vm.characters.length,
          itemBuilder: (context, index) {
            final characterVM = vm.characters[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              // Reuso do componente de Card do Design System
              child: CharacterCard(vm: characterVM),
            );
          },
        );
    }
  }
}