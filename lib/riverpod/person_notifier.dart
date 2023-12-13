import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viajes_uci_pr/models/person.dart';

class PersonNotifier extends AsyncNotifier<List<dynamic>> {
  Future<List<Person>> getPersonList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("persons") ?? "[]";
    final personList = (jsonDecode(jsonString) as List);
    return personList.map((e) => Person.fromJson(e)).toList().cast<Person>();
  }

  @override
  Future<List<Person>> build() async {
    return getPersonList();
  }

  Future<void> addPerson(Person newPerson) async {
    final prefs = await SharedPreferences.getInstance();
    state = const AsyncValue.loading();
    List<dynamic> personList = await getPersonList();
    state = await AsyncValue.guard(() async {
      personList.add(newPerson);
      prefs.setString("persons", jsonEncode(personList));
      return personList;
    });
  }
}

final personProvider = AsyncNotifierProvider<PersonNotifier, List<dynamic>>(
    () => PersonNotifier());
