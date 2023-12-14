import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier_provider.dart';

class SelectedPersonsController extends Notifier<List<bool>> {
  @override
  List<bool> build() {
    final personList = ref.watch(personProvider).value ?? [];
    return List.generate(personList.length, (index) => false);
  }

  void toggleSelectedIndex(int index) {
    state = state
        .asMap()
        .entries
        .map((entry) => entry.key == index ? !entry.value : entry.value)
        .toList();
  }

  void deselectAll() {
    
  }
}

final selectedPersonsProvider =
    NotifierProvider<SelectedPersonsController, List<bool>>(
        () => SelectedPersonsController());
