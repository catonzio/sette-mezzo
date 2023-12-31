import 'package:flutter/material.dart';
import 'package:sette_e_mezzo/utils/utils.dart';
import 'dart:math' as math;
import '../../data/models/deck.dart';

class DeckWidget extends StatelessWidget {
  final Deck deck;
  final List<double> angles;
  final double width;
  final double height;

  DeckWidget(
      {super.key,
      required this.deck,
      required this.width,
      required this.height})
      : angles = generateAngles(deck.cards.length);

  static List<double> generateAngles(int num) {
    math.Random source = math.Random();
    return [
      for (int i = 0; i < num; i++) doubleInRange(source, -0.05, 0.05) * math.pi
    ];
  }

  @override
  Widget build(BuildContext context) {
    Container coverCard = Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/cards/cover.jpg',
        fit: BoxFit.contain,
      ),
    );
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          for (double angle in angles)
            Positioned(
              top: 0,
              left: 0,
              width: width,
              height: height,
              child: Transform.rotate(angle: angle, child: coverCard),
            ),
        ],
      ),
    );
  }
}
