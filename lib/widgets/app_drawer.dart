import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueGrey[200]
          ),
            child: const Center(
                child: Text("Viajes UCI / PR", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                ),))),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.calendar_today_outlined),
          title: Text("Ver lista completa"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.info_outline),
          title: Text("Acerca de"),
        ),
      ],
    ));
  }
}
