import 'package:get/get.dart';

import '../models/card.dart';
import '../models/player.dart';

class PlayerController extends GetxController {
  final Player player;

  double get score => player.score;
  RxList<CardModel> get cards => player.cards;

  PlayerController(this.player);

  void addCard(CardModel card) {
    player.cards.add(card);
    player.score = computeScore();
  }

  void removeLastCard() {
    player.cards.removeLast();
    player.score = computeScore();
  }

  double computeScore() {
    if (player.cards.contains(jolly)) {
      if (player.cards.length == 1) return 0.5;
      double points = player.cards
          .where((CardModel c) => c != jolly)
          .map((CardModel c) => c.value)
          .reduce((el1, el2) => el1 + el2)
          .toDouble();
      return points.toInt() == points ? 7 : 7.5;
    } else {
      return player.cards
          .map((CardModel c) => c.value)
          .reduce((el1, el2) => el1 + el2)
          .toDouble();
    }
  }

  void reset() {
    player.cards.clear();
    player.score = 0.0;
  }
}
