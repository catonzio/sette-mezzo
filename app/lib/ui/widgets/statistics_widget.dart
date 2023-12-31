import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/card.dart';
import '../../data/models/deck.dart';

class StatisticsWidget extends StatelessWidget {
  final Deck deck;
  const StatisticsWidget({super.key, required this.deck});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: context.theme.colorScheme.surface.withOpacity(0.5),
      child: Obx(() => ListView(
            children: [
              ListTile(
                title: const AutoSizeText(
                  "# Cards left",
                  maxLines: 2,
                ),
                trailing: Text(deck.cards.length.toString()),
              ),
              ListTile(
                title: const AutoSizeText(
                  "# Cards used",
                  maxLines: 2,
                ),
                trailing: Text(deck.used.length.toString()),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of the Jolly",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfJolly.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 0.5",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfHalf.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 1",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfOne.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 2",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfTwo.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 3",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfThree.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 4",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfFour.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 5",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfFive.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 6",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfSix.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a 7",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfSeven.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a < 4",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfUnderFour.toStringAsFixed(2)),
              ),
              ListTile(
                title: const AutoSizeText(
                  "Prob. of a > 4",
                  maxLines: 2,
                ),
                trailing: Text(probabilityOfOverFour.toStringAsFixed(2)),
              ),
            ],
          )),
    );
  }

  get probabilityOfJolly =>
      deck.cards.where((CardModel c) => c == jolly).length / deck.cards.length;
  get probabilityOfHalf =>
      deck.cards.where((CardModel c) => c.value == 0.5).length /
      deck.cards.length;
  get probabilityOfOne =>
      deck.cards.where((CardModel c) => c.value == 1).length /
      deck.cards.length;
  get probabilityOfTwo =>
      deck.cards.where((CardModel c) => c.value == 2).length /
      deck.cards.length;
  get probabilityOfThree =>
      deck.cards.where((CardModel c) => c.value == 3).length /
      deck.cards.length;
  get probabilityOfFour =>
      deck.cards.where((CardModel c) => c.value == 4).length /
      deck.cards.length;
  get probabilityOfFive =>
      deck.cards.where((CardModel c) => c.value == 5).length /
      deck.cards.length;
  get probabilityOfSix =>
      deck.cards.where((CardModel c) => c.value == 6).length /
      deck.cards.length;
  get probabilityOfSeven =>
      deck.cards.where((CardModel c) => c.value == 7).length /
      deck.cards.length;
  get probabilityOfUnderFour =>
      deck.cards.where((CardModel c) => c.value < 4).length / deck.cards.length;
  get probabilityOfOverFour =>
      deck.cards.where((CardModel c) => c.value > 4).length / deck.cards.length;
}
