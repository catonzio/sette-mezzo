import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/game_controller.dart';
import '../../data/models/enums.dart';
import 'bet_dialog.dart';
import '../../utils/extensions.dart';

class ActionButtons extends StatelessWidget {
  final GameController controller;
  final double width;
  final double height;

  const ActionButtons(
      {super.key,
      required this.controller,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = width * 2 / 3;
    double buttonHeight = height / 7;
    return Material(
      elevation: 5,
      color: context.theme.colorScheme.surface.withOpacity(0.5),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionButton(
              text: "Give cards",
              onPressed: () {
                controller.deckController.preloadImages();
                controller.start(shuffle: true);
              },
              width: buttonWidth,
              height: buttonHeight,
              isDisabled: controller.gameStatus != GameStatus.notPlaying,
            ),
            ActionButton(
              text: "Bet",
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    BetDialog(controller: controller),
              ),
              width: buttonWidth,
              height: buttonHeight,
              isDisabled: controller.gameStatus != GameStatus.betting,
            ),
            ActionButton(
              text: "Take card",
              onPressed: controller.playerGetCard,
              width: buttonWidth,
              height: buttonHeight,
              isDisabled: controller.gameStatus != GameStatus.playerPlaying,
            ),
            ActionButton(
              text: "Still",
              onPressed: controller.playerStop,
              width: buttonWidth,
              height: buttonHeight,
              isDisabled: controller.gameStatus != GameStatus.playerPlaying,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisabled;
  final double width;
  final double height;

  const ActionButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    Function()? onPressed = isDisabled ? null : this.onPressed;
    TextStyle? style = isDisabled
        ? context.theme.textTheme.labelLarge?.copyWith(
            color: context.theme.colorScheme.onSurface.withOpacity(0.5))
        : context.theme.textTheme.labelLarge;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          child: AutoSizeText(
            text,
            style: style,
            presetFontSizes: [
              context.labelLargeFontSize,
              context.labelMediumFontSize,
              context.labelSmallFontSize,
              context.labelSmallFontSize / 1.1,
            ],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
