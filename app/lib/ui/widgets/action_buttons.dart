import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/game_controller.dart';
import '../../data/models/enums.dart';
import 'bet_dialog.dart';
import '../../utils/extensions.dart';

class ActionButtons extends StatelessWidget {
  final GameController controller = Get.find<GameController>();
  final double buttonWidth;
  final double buttonHeight;

  ActionButtons(
      {super.key, required this.buttonWidth, required this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons =
        actionButtons[controller.gameStatus] ?? []; // getButtons(context);

    return Material(
      elevation: 5,
      color: context.theme.colorScheme.surface.withOpacity(0.5),
      child: Container(
        color: Colors.red,
        width: buttonWidth * buttons.length + buttonWidth,
        height: buttonHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons,
        ),
      ),
    );
  }

  Map<GameStatus, List<ActionButton>> get actionButtons => {
        GameStatus.notPlaying: [
          ActionButton(
            text: "Give cards",
            onPressed: giveCards,
            width: buttonWidth,
            height: buttonHeight,
          ),
        ],
        GameStatus.betting: [
          ActionButton(
            text: "Bet",
            onPressed: bet,
            width: buttonWidth,
            height: buttonHeight,
          ),
        ],
        GameStatus.playerPlaying: [
          ActionButton(
            text: "Take card",
            onPressed: controller.playerGetCard,
            width: buttonWidth,
            height: buttonHeight,
          ),
          ActionButton(
            text: "Still",
            onPressed: controller.playerStop,
            width: buttonWidth,
            height: buttonHeight,
          )
        ],
      };

  void giveCards() {
    controller.deckController.preloadImages();
    controller.start(shuffle: true);
  }

  void bet() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => BetDialog(controller: controller),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  final double height;

  const ActionButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          child: AutoSizeText(
            text,
            style: context.theme.textTheme.labelLarge,
            presetFontSizes: [
              context.headlineLargeFontSize,
              context.headlineMediumFontSize,
              context.headlineSmallFontSize,
              context.bodyLargeFontSize,
              context.bodyMediumFontSize,
              context.bodySmallFontSize,
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
