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
            Container(
              width: 60,
              height: 60,
              child: Image.network(cardInfo.image),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardInfo.name,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardInfo.email,
              style: const TextStyle(
                color: Color(0xFF6F35A5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
