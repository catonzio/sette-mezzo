import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/deck_controller.dart';

class DeckWidget extends StatelessWidget {
  final DeckController deck = Get.find<DeckController>();
  // final List<double> angles;
  final double width;
  final double height;

  DeckWidget(
      {super.key,
      required this.width,
      required this.height});

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
          for (double angle in deck.angles)
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
