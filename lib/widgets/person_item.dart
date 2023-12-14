import 'package:flutter/material.dart';
import 'package:viajes_uci_pr/widgets/turn_number.dart';

class PersonItem extends StatelessWidget {
  final String name;
  final String destination;
  final int? turnNumber;
  final bool isReserved;
  final bool isSelected;
  final void Function() onLongPress;
  final void Function() onTap;

  const PersonItem(
      {super.key,
      required this.name,
      required this.destination,
      required this.turnNumber,
      this.isSelected = false,
      this.isReserved = false,
      required this.onLongPress,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onLongPress,
        onTap: onTap,
        selected: isSelected,
        selectedTileColor: Colors.grey[300],
        visualDensity: VisualDensity.comfortable,
        contentPadding: const EdgeInsets.all(10),
        leading: Stack(children: [
          isReserved && turnNumber != null
              ? TurnNumber(number: turnNumber!)
              : const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person_2_rounded),
                ),
          isSelected
              ? Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
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
        subtitle: Text(destination),
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
