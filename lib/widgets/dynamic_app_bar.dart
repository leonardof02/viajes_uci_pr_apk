import 'package:flutter/material.dart';

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isEditing;
  final Function() onDelete;
  final Function() onClose;

  const DynamicAppBar(
      {super.key,
      this.isEditing = false,
      required this.onDelete,
      required this.onClose});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (!isEditing
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                onClose();
              },
            )),
      title: Text(
        (!isEditing ? "Viajes UCI / Pinar del Rio" : "Editar Personas"),
        style:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
      ),
      backgroundColor: Colors.blueGrey[800],
      actions: isEditing
          ? [
              IconButton(
                  onPressed: () {
                    onDelete();
                  },
                  icon: const Icon(Icons.delete))
            ]
          : null,
    );
  }
}
