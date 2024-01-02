import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/game_controller.dart';
import 'package:sette_e_mezzo/ui/widgets/action_buttons.dart';
import 'package:sette_e_mezzo/ui/widgets/new_cards_stack_widget.dart';
import 'package:sette_e_mezzo/utils/constants.dart';
import 'dart:math' as math;

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    double cardHeight = context.height * 0.2;
    double cardWidth = cardHeight * cardRatio;
    return Scaffold(
      body: GetX<GameController>(
          builder: (controller) => Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: Text(controller.playerController.score.toString()),
                  ),
                  Positioned(
                    top: context.height * 0.5 - cardHeight / 2,
                    left: context.width * 0.5 -
                        cardWidth / 2 -
                        (cardWidth *
                            (math.max(
                                controller.playerController.cards.length - 1,
                                0))),
                    child: Container(
                      color: Colors.red,
                      child: NewCardsStackWidget(
                        controller: controller.playerController,
                        cardWidth: cardWidth,
                        cardHeight: cardHeight,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: ActionButtons(
                        buttonWidth: context.width * 0.2,
                        buttonHeight: context.height * 0.2,
                      ))
                ],
              )),
    );
  }
}
