import 'package:flutter/material.dart';

class ListTileReusable extends StatelessWidget {
  const ListTileReusable(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.trailingIconButton});
  final String title;
  final Icon leadingIcon;
  final IconButton trailingIconButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: leadingIcon,
      ),
      title: Text(title),
      trailing:trailingIconButton ,
    );
  }
}
