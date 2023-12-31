import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/game_controller.dart';

class BetDialog extends StatelessWidget {
  final GameController controller;

  const BetDialog({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Make your bet"),
      content: SizedBox(
        width: context.width * 0.2,
        child: TextField(
          controller: controller.betController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Bet",
              hintText: "Insert your bet"),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.makeBet(
                  double.tryParse(controller.betController.text) ?? 0.0);
              controller.betController.clear();
              Get.back();
            },
            child: const Text("Bet"))
      ],
    );
  }
}
