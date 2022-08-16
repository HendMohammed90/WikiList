import 'package:flutter/material.dart';

class listItem extends StatelessWidget {
  String listText = '';

  listItem({required this.listText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/person1.jpeg'),
      ),
      title: Text(
        listText,
        style: const TextStyle(
          // color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
