import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier.dart';
import 'package:viajes_uci_pr/widgets/person_item.dart';

import '../models/person.dart';

class PersonList extends ConsumerWidget {
  const PersonList({super.key});

  Widget renderListFromData(List<Person> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => PersonItem(
        name: data[index].fullName,
        destination: data[index].destination,
        turnNumber: data[index].turn,
        isReserved: data[index].isReserved,
        isSelected: false,
      ),
    );
  }

  Widget renderError(Object error, StackTrace stackTrace) {
    print(stackTrace);
    return Text("$error");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final personList = ref.watch(personProvider);

    return personList.when(
      data: renderListFromData,
      error: renderError,
      loading: () => const CircularProgressIndicator()
    );
    
  }
}