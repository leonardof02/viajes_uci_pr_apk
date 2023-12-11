import 'package:flutter/material.dart';
import 'package:viajes_uci_pr/widgets/turn_number.dart';

class PersonItem extends StatelessWidget {
  final String name;
  final String bridgeName;
  final int turnNumber;
  final bool isReserved;
  final bool isSelected;

  const PersonItem(
      {super.key,
      required this.name,
      required this.bridgeName,
      required this.turnNumber,
      this.isSelected = false,
      this.isReserved = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        selected: isSelected,
        selectedTileColor: Colors.grey[300],
        visualDensity: VisualDensity.comfortable,
        contentPadding: const EdgeInsets.all(20),
        onTap: () {},
        leading: Stack(children: [
          isReserved
              ? TurnNumber(number: turnNumber)
              : Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  child: const Icon(
                    Icons.person_2_sharp,
                    color: Colors.white,
                  )),
          isSelected
              ? Positioned(
                  right: -5,
                  bottom: -5,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                )
              : const SizedBox(),
        ]),
        title: Text(name),
        subtitle: Text(bridgeName),
        trailing: FilledButton(
          onPressed: !isReserved ? () => {} : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.green;
                }
                return Colors.red;
              },
            ),
          ),
          child: !isReserved ? const Text("Reservar") : const Text("Reservado"),
        ));
  }
}
