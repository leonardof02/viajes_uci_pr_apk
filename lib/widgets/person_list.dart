import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/riverpod/editing_mode_provider.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier_provider.dart';
import 'package:viajes_uci_pr/riverpod/selected_persons_provider.dart';
import 'package:viajes_uci_pr/widgets/person_item.dart';

import '../models/person.dart';

class PersonList extends ConsumerWidget {
  const PersonList({super.key});

  Widget renderListFromData(List<Person> data, WidgetRef ref) {
    final isEditing = ref.watch(editModeProvider);
    final selectedItems = ref.watch(selectedPersonsProvider);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => PersonItem(
        onLongPress: () {
          if (!isEditing) {
            ref.read(editModeProvider.notifier).setEditing(true);
            ref
                .read(selectedPersonsProvider.notifier)
                .toggleSelectedIndex(index);
          }
        },
        onTap: () {
          if (isEditing) {
            ref
                .read(selectedPersonsProvider.notifier)
                .toggleSelectedIndex(index);
            if (!ref.watch(selectedPersonsProvider).contains(true)) {
              ref.read(editModeProvider.notifier).setEditing(false);
            }
          }
        },
        name: data[index].fullName,
        destination: data[index].destination,
        turnNumber: data[index].turn,
        isReserved: data[index].isReserved,
        isSelected: selectedItems[index],
      ),
    );
  }

  Widget renderError(Object error, StackTrace stackTrace) {
    return Text("$error");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personList = ref.watch(personProvider);

    return personList.when(
        data: (data) => renderListFromData(data, ref),
        error: renderError,
        loading: () => const CircularProgressIndicator());
  }
}
