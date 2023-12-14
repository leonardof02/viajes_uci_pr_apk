import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/riverpod/editing_mode_provider.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier_provider.dart';
import 'package:viajes_uci_pr/riverpod/selected_persons_provider.dart';
import 'package:viajes_uci_pr/widgets/add_person_form.dart';
import 'package:viajes_uci_pr/widgets/app_drawer.dart';
import 'package:viajes_uci_pr/widgets/dynamic_app_bar.dart';
import 'package:viajes_uci_pr/widgets/person_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(editModeProvider);
    final personList = ref.watch(personProvider);
    final selectedIndexes = ref.watch(selectedPersonsProvider);

    return Scaffold(
      drawer: const AppDrawer(),
        appBar: DynamicAppBar(
            isEditing: isEditing,
            onDelete: () {
              ref.read(personProvider.notifier).removeSelectedPersons( selectedIndexes );
            },
            onClose: () {
              ref.invalidate(selectedPersonsProvider);
              ref.read(editModeProvider.notifier).setEditing(false);
            }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddPersonForm();
                  });
            },
            label: const Text("Agregar Persona"),
            icon: const Icon(Icons.person_add_alt_1_sharp)),
        body: const PersonList());
  }
}
