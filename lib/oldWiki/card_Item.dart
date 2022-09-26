import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  dynamic backGroundColor;
  late IconData iconType = FontAwesomeIcons.f;
  String cardText = '';
  ReusableCard(
      {Key? key,
      required this.backGroundColor,
      required this.iconType,
      required this.cardText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            iconType,
            color: Colors.white,
            size: 20,
          ),
          Text(
            cardText.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
