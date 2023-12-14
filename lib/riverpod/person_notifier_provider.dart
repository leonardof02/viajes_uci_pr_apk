import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viajes_uci_pr/models/person.dart';
import 'package:viajes_uci_pr/riverpod/selected_persons_provider.dart';

class PersonController extends AsyncNotifier<List<Person>> {
  Future<List<Person>> getPersonList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("persons") ?? "[]";
    final personList = (jsonDecode(jsonString) as List);
    return personList.map((e) => Person.fromJson(e)).toList().cast<Person>();
  }

  @override
  FutureOr<List<Person>> build() async {
    return getPersonList();
  }

  Future<void> addPerson(Person newPerson) async {
    final prefs = await SharedPreferences.getInstance();
    state = const AsyncValue.loading();
    List<Person> personList = await getPersonList();
    state = await AsyncValue.guard<List<Person>>(() async {
      personList.add(newPerson);
      prefs.setString("persons", jsonEncode(personList));
      return personList;
    });
  }

  Future<void> removeSelectedPersons(List<bool> selectedIndexes) async {
    // TODO: Implement remove persons
    // final prefs = await SharedPreferences.getInstance();
    // List<Person> personList = await getPersonList();
    // List<Person> personsToSave = personList
    //     .asMap()
    //     .entries
    //     .where((entry) => !selectedIndexes[entry.key]).toList().cast<Person>();
    // state = await AsyncValue.guard<List<Person>>(() async {
    //   prefs.setString("persons", jsonEncode(personsToSave));
    //   return personList;
    // });
  }
}

final personProvider = AsyncNotifierProvider<PersonController, List<Person>>(
    () => PersonController());
