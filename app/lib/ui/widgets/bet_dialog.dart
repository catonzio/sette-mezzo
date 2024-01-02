import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        height: context.height * 0.075,
        child: TextField(
          controller: controller.betController,
          keyboardType: const TextInputType.numberWithOptions(
              signed: false, decimal: true),
          inputFormatters: <TextInputFormatter>[
            // FilteringTextInputFormatter.allow(r'[0-9]+[,.]{0,1}[0-9]*'),
            TextInputFormatter.withFunction(
              (oldValue, newValue) => newValue.copyWith(
                text: newValue.text.replaceAll('.', ','),
              ),
            ),
          ],
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixText: "€",
              labelText: "Bet",
              hintText: "Insert your bet",
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {},
                    child: const Icon(Icons.arrow_drop_up),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              )),
          maxLines: 1,
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
