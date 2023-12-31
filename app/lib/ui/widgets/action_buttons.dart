import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/game_controller.dart';
import 'package:sette_e_mezzo/data/models/enums.dart';
import 'package:sette_e_mezzo/ui/widgets/bet_dialog.dart';

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
              onPressed: () => controller.start(shuffle: true),
              width: width * 2 / 3,
              isDisabled: controller.gameStatus != GameStatus.notPlaying,
            ),
            ActionButton(
              text: "Bet",
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    BetDialog(controller: controller),
              ),
              width: width * 2 / 3,
              isDisabled: controller.gameStatus != GameStatus.betting,
            ),
            ActionButton(
              text: "Take card",
              onPressed: controller.playerGetCard,
              width: width * 2 / 3,
              isDisabled: controller.gameStatus != GameStatus.playerPlaying,
            ),
            ActionButton(
              text: "Still",
              onPressed: controller.playerStop,
              width: width * 2 / 3,
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

  const ActionButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: null,
            child: AutoSizeText(
              text,
              style: context.theme.textTheme.labelLarge?.copyWith(
                  color: context.theme.colorScheme.onSurface.withOpacity(0.5)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
      );
    }
    return SizedBox(
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: AutoSizeText(
            text,
            style: context.theme.textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
