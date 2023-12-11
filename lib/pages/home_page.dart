import 'package:flutter/material.dart';
import 'package:viajes_uci_pr/widgets/add_person_form.dart';
import 'package:viajes_uci_pr/widgets/person_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: "Personas Agregadas"),
              Tab(text: "Lista de reservas")
            ]),
            title: const Text(
              "Viajes UCI / Pinar del Rio",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            backgroundColor: Colors.blueGrey[800],
          ),
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
          body: const TabBarView(children: [const PersonList(), Placeholder()])),
    );
  }
}
