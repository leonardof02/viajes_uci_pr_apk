import 'package:flutter/material.dart';

class AddPersonForm extends StatelessWidget {
  final idController = TextEditingController(text: "");
  final nameController = TextEditingController(text: "");
  final destinationController = TextEditingController(text: "Pinar del Rio");
  final List<String> destinationList = [
    'Pinar del Rio',
    'Puerta de Golpe',
    'Consolacion',
    'Herradura',
    'Los Palacios',
    'Paso Real',
    'Taco Taco',
    'San Cristobal',
    'Candelaria',
    'Las Terrazas'
  ];

  AddPersonForm({super.key});

  void handleChange(String? newValue) {
    destinationController.text = newValue ?? destinationController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              hintText: "Escriba su numero de CI",
              border: OutlineInputBorder(),
              label: Text("CI"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Escriba su nombre y apellido",
              border: OutlineInputBorder(),
              label: Text("Nombre y Apellido"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField<String>(
              value: destinationController.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: 'Selecciona un valor',
              ),
              items: destinationList
                  .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
              onChanged: handleChange),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {}, child: Text("Agregar Persona")))
        ],
      )),
    );
  }
}
