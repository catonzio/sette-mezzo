import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/home_controller.dart';
import 'package:sette_e_mezzo/ui/widgets/deck_widget.dart';
import 'package:sette_e_mezzo/ui/widgets/menu_dialog.dart';
import 'package:sette_e_mezzo/ui/widgets/statistics_widget.dart';
import 'dart:math' as math;

import '../../data/controllers/game_controller.dart';
import '../../utils/constants.dart';
import '../widgets/action_buttons.dart';
import '../widgets/player_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    final double halfCircleHeight = context.height * 0.025;
    final double halfCircleWidth = context.width * 0.025;
    final double halfCircleDiameter =
        math.max(halfCircleHeight, halfCircleWidth);

    return Scaffold(body: GetX<GameController>(
      builder: (controller) {
        return SizedBox(
          width: context.width,
          height: context.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    width: context.width,
                    height: context.height,
                    child: HomeBody(),
                  ),
                  if (homeController.isStatisticsOpen)
                    Positioned(
                      top: 0,
                      right: 0,
                      width: context.width -
                          context.width * homeController.percentage,
                      height: context.height,
                      child: StatisticsWidget(
                        deck: controller.deckController.deck,
                      ),
                    ),
                  Positioned(
                      top: context.height * 0.5 - halfCircleDiameter / 2,
                      left: context.width * homeController.percentage -
                          halfCircleDiameter / 2,
                      height: halfCircleDiameter,
                      width: halfCircleDiameter,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          if (homeController.isStatisticsOpen) {
                            homeController.changePercentage(
                                homeController.percentage +
                                    details.delta.dx / context.width);
                          }
                        },
                        onTap: () {
                          homeController.toggleStatistics();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.theme.colorScheme.primary,
                          ),
                          width: halfCircleDiameter,
                          height: halfCircleDiameter,
                        ),
                      )),
                ],
              ),
              if (controller.gameIsOver)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: MenuDialog(
                    controller: controller,
                  ),
                ),
            ],
          ),
        );
      },
    ));
  }
}

class HomeBody extends StatelessWidget {
  final GameController controller = Get.find<GameController>();

  final double deckTop = 0.05;
  final double deckLeft = 0.1;
  final double deckWidth = 0.2;
  final double deckHeight = 0.2;

  final double dealerTop = 0.1;
  final double dealerLeft = 0.45;
  final double dealerWidth = 0.5;
  final double dealerHeight = 0.4;

  final double playerBottom = 0.1;
  final double playerLeft = 0.45;
  final double playerWidth = 0.5;
  final double playerHeight = 0.4;

  final double buttonsTop = 0.1;
  final double buttonsLeft = 0.1;
  final double buttonsWidth = 0.2;
  final double buttonsHeight = 0.4;

  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    double cardHeight = context.height * 0.2;
    double cardWidth = cardHeight * cardRatio;
    double width = context.width;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: context.height * deckTop,
            left: width * deckLeft,
            child: DeckWidget(
              deck: controller.deckController.deck,
              width: width * deckWidth,
              height: context.height * deckHeight,
            )),
        Positioned(
          top: context.height * dealerTop,
          left: width * dealerLeft,
          width: width * dealerWidth,
          height: context.height * dealerHeight,
          child: PlayerWidget(
            controller: controller.dealerController,
            cardWidth: cardWidth,
            cardHeight: cardHeight,
            isDealer: true,
          ),
        ),
        Positioned(
          bottom: context.height * playerBottom,
          left: width * playerLeft,
          width: width * playerWidth,
          height: context.height * playerHeight,
          child: PlayerWidget(
            controller: controller.playerController,
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
        ),
        Positioned(
          bottom: context.height * buttonsTop,
          left: width * buttonsLeft,
          child: ActionButtons(
              controller: controller,
              width: width * buttonsWidth,
              height: context.height * buttonsHeight),
        )
      ],
    );
  }
}
