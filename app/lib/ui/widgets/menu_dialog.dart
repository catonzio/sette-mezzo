import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/game_controller.dart';
import 'package:sette_e_mezzo/data/models/enums.dart';

class MenuDialog extends StatelessWidget {
  final GameController controller;

  const MenuDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    String title = controller.gameStatus == GameStatus.playerOver ||
            controller.gameStatus == GameStatus.dealerWin
        ? "You lose"
        : "You win";
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: context.width * 0.2,
        height: context.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("The dealer score is ${controller.dealerController.score}"),
            Text("Your score is ${controller.playerController.score}"),
            const Text("What you want to do?"),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.restartGame();
              Get.back();
            },
            child: const Text("Restart")),
        TextButton(
            onPressed: () {
              controller.continueGame();
              Get.back();
            },
            child: const Text("Continue")),
      ],
    );
  }
}
