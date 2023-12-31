import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/player_controller.dart';
import 'cards_stack_widget.dart';

class PlayerWidget extends StatelessWidget {
  final PlayerController controller;
  final double cardWidth;
  final double cardHeight;
  final bool isDealer;

  const PlayerWidget(
      {super.key,
      required this.controller,
      required this.cardWidth,
      required this.cardHeight,
      this.isDealer = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isDealer)
          CardsStackWidget(
            controller: controller,
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
        Obx(
          () => SizedBox(
            width: context.width * 0.25,
            child: AutoSizeText(
              "${controller.player.name} score: ${(isDealer && controller.cards.firstOrNull?.isCover == false) || !isDealer ? controller.score : 0}",
              style: context.textTheme.displaySmall,
              maxFontSize: context.textTheme.headlineSmall!.fontSize ?? 20,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (!isDealer)
          CardsStackWidget(
            controller: controller,
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
      ],
    );
  }
}
