import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/models/person.dart';

class PersonNotifier extends Notifier<List<Person>> {
  @override
  List<Person> build() {
    return [];
  }

  void addPerson(Person newPerson) {
    state = [...state, newPerson];
  }
}

final personProvider = NotifierProvider<PersonNotifier, List<Person>>(() => PersonNotifier());
