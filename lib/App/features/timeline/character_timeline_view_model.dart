import 'package:flutter/material.dart';
import '/App/core/api/hp_api.dart';
import '/App/core/models/character_model.dart';
import '/DesignSystem/components/CharacterCard/character_card_view_model.dart';
import '/App/core/coordinator/app_coordinator.dart';

// tela estado
enum TimelineState { loading, loaded, error }

class CharacterTimelineViewModel extends ChangeNotifier {
  final AppCoordinator coordinator;
  final HpApi apiService;

  TimelineState _state = TimelineState.loading;
  TimelineState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CharacterCardViewModel> _characters = [];
  List<CharacterCardViewModel> get characters => _characters;

  CharacterTimelineViewModel(this.coordinator, {required this.apiService}) {
    _fetchCharacters();
  }

  // busca dados
  Future<void> _fetchCharacters() async {
    _setState(TimelineState.loading);
    _errorMessage = null;

    try {
      // chama o serviço api
      final List<CharacterModel> fetchedModels = await apiService.fetchAllCharacters();
      _characters = fetchedModels.map((model) => model.toViewModel())
      // filtro personagens
          .where((vm) => vm.image != null && vm.image!.isNotEmpty).cast<CharacterCardViewModel>()
          .toList();

      _setState(TimelineState.loaded);
    } catch (e) {
      _errorMessage = 'Falha ao carregar a lista de personagens. Tente novamente.';
      debugPrint('API Error: $e');
      _setState(TimelineState.error);
    }
  }

  void _setState(TimelineState newState) {
    _state = newState;
    notifyListeners();
  }

  // recarrega dados
  void reloadData() {
    _fetchCharacters();
  }
}