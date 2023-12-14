import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes_uci_pr/helpers/validator.dart';
import 'package:viajes_uci_pr/models/person.dart';
import 'package:viajes_uci_pr/riverpod/person_notifier_provider.dart';
import '../constants/destinations.dart';

class AddPersonForm extends ConsumerWidget {
  final idController = TextEditingController(text: "");
  final nameController = TextEditingController(text: "");
  final destinationController = TextEditingController(text: "Pinar del Rio");
  final formKey = GlobalKey<FormState>();

  AddPersonForm({super.key});

  void handleChange(String? newValue) {
    destinationController.text = newValue ?? destinationController.text;
  }

  Future<void> addNewPerson(WidgetRef ref) async {
    ref.read(personProvider.notifier).addPerson(Person(
        id: idController.text,
        fullName: nameController.text,
        destination: destinationController.text,
        isReserved: false));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: idController,
                validator: Validator.validateCubanCI,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: "Escriba su numero de CI",
                  border: OutlineInputBorder(),
                  label: Text("CI"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                validator: Validator.validateFullName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: "Escriba su nombre y apellido",
                  border: OutlineInputBorder(),
                  label: Text("Nombre y Apellido"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                  value: destinationController.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: UnderlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: Icon(Icons.place_outlined),
                    labelText: 'Selecciona el puente donde te quedas',
                  ),
                  items: destinationList
                      .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: handleChange),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) await addNewPerson(ref);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Persona Agregada con exito"),
                          backgroundColor: Colors.green,
                        ));
                        Navigator.of(context).pop();
                      },
                      child: const Text("Agregar Persona")))
            ],
          )),
    );
  }
}
