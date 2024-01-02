import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/player_controller.dart';
import 'package:sette_e_mezzo/ui/widgets/card_widget.dart';

class NewCardsStackWidget extends StatelessWidget {
  final PlayerController controller;
  final double cardWidth;
  final double cardHeight;

  const NewCardsStackWidget(
      {super.key,
      required this.controller,
      required this.cardWidth,
      required this.cardHeight});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = context.width * 0.03;
    // double verticalPadding = context.height * 0.03;

    if (controller.cards.isEmpty) {
      return CardWidget(card: null, width: cardWidth, height: cardHeight);
    }
    return Obx(() => SizedBox(
          width: cardWidth + (controller.cards.length - 1) * horizontalPadding,
          height: cardHeight,
          // height: cardHeight + (controller.cards.length - 1) * verticalPadding,
          child: Stack(
            children: controller.cards.map((e) {
              return AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: controller.cards.indexOf(e) * horizontalPadding,
                  // bottom: controller.cards.indexOf(e) * verticalPadding,
                  child: CardWidget(
                    card: e,
                    width: cardWidth,
                    height: cardHeight,
                  ));
            }).toList(),
          ),
        ));
  }
}
