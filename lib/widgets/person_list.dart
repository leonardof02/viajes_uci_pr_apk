import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier.dart';
import 'package:viajes_uci_pr/widgets/person_item.dart';

class PersonList extends ConsumerWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final personList = ref.watch(personProvider).value ?? [];

    return ListView.builder(
      itemCount: personList.length,
      itemBuilder: (context, index) => PersonItem(
        name: personList[index].fullName,
        destination: personList[index].destination,
        turnNumber: personList[index].turn,
        isReserved: personList[index].isReserved,
        isSelected: false,
      ),
    );
  }
}
