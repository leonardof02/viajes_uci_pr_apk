import 'package:flutter/material.dart';
import 'package:viajes_uci_pr/widgets/person_item.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key});

  static const List<Map<String, dynamic>> personList = [
    {
      "name": "Carlos Fuentes",
      "bridgeName": "San Cristobal",
      "turnNumber": 21,
      "isReserved": false,
      "isSelected": true,
    },
    {
      "name": "Alberto Carlos",
      "bridgeName": "Pinar del Rio",
      "turnNumber": 2,
      "isReserved": true,
      "isSelected": true,
    },
    {
      "name": "Roberto Miranda",
      "bridgeName": "Consolacion",
      "turnNumber": 3,
      "isReserved": true,
      "isSelected": false,
    },
    {
      "name": "Carlos Fuentes",
      "bridgeName": "Herradura",
      "turnNumber": 14,
      "isReserved": false,
      "isSelected": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personList.length,
      itemBuilder: (context, index) => PersonItem(
        name: personList[index]["name"],
        bridgeName: personList[index]["bridgeName"],
        turnNumber: personList[index]["turnNumber"],
        isReserved: personList[index]["isReserved"],
        isSelected: personList[index]["isSelected"] ?? false,
      ),
    );
  }
}
