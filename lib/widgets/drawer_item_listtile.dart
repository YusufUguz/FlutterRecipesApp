import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerItemsListTile extends StatelessWidget {
  final String listTileText;
  Icon icon;
  VoidCallback onTap;
  // ignore: use_key_in_widget_constructors
  DrawerItemsListTile({
    Key? key,
    required this.listTileText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: -5,
      leading: icon,
      title: Text(
        listTileText,
        style: const TextStyle(
            fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
