import 'package:flutter/material.dart';
import '../../models/card_info.dart';

class CardComponents extends StatelessWidget {
  late final CardInfoModel cardInfo;

  CardComponents({required this.cardInfo});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardInfo.onCardClick != null) cardInfo.onCardClick!(cardInfo);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(cardInfo.image),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardInfo.title,
              style: const TextStyle(color: Colors.lightBlue),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardInfo.subtitle,
              style: const TextStyle(color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }
}
