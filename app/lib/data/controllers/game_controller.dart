import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/controllers/deck_controller.dart';
import 'package:sette_e_mezzo/data/controllers/player_controller.dart';
import 'package:sette_e_mezzo/data/models/card.dart';
import 'package:sette_e_mezzo/data/models/enums.dart';

import '../models/player.dart';

class GameController extends GetxController {
  final DeckController deckController;
  final PlayerController playerController;
  final PlayerController dealerController;

  final Rx<GameStatus> _gameStatus = GameStatus.notPlaying.obs;
  GameStatus get gameStatus => _gameStatus.value;
  set gameStatus(GameStatus value) => _gameStatus.value = value;

  final RxDouble _bet = 0.0.obs;
  double get bet => _bet.value;
  set bet(double value) => _bet.value = value;

  final TextEditingController betController = TextEditingController();

  bool get gameIsOver => [
        GameStatus.dealerOver,
        GameStatus.dealerWin,
        GameStatus.playerOver,
        GameStatus.playerWin
      ].contains(gameStatus);

  GameController(
      {required this.deckController,
      required this.playerController,
      required this.dealerController});

  void start({bool shuffle = false}) {
    if (shuffle) deckController.shuffle();
    playerController.reset();
    dealerController.reset();
    playerController.addCard(deckController.draw(isCover: false));
    // playerController.cards.firstOrNull?.isCover = false;
    dealerController.addCard(deckController.draw());
    gameStatus = GameStatus.betting;
  }

  void makeBet(double amount) {
    bet = amount;
    gameStatus = GameStatus.playerPlaying;
  }

  void playerGetCard() {
    playerController.addCard(deckController.draw(isCover: false));
    if (playerController.score > 7.5) {
      gameStatus = GameStatus.playerOver;
      // Get.snackbar("Over", "Player is over 7.5");
      dealerController.cards.firstOrNull?.isCover = false;
    }
  }

  void playerStop() {
    dealerController.cards.firstOrNull?.isCover = false;
    gameStatus = GameStatus.dealerPlaying;
    dealerPlay();
  }

  void dealerPlay() async {
    while (dealerController.score < 5.5 ||
        dealerController.score < playerController.score) {
      await Future.delayed(const Duration(seconds: 1));
      dealerGetCard();
    }
    checkWinner();
  }

  void dealerGetCard() {
    dealerController.addCard(deckController.draw(isCover: false));
    if (dealerController.score > 7.5) {
      gameStatus = GameStatus.dealerOver;
      // Get.snackbar("Over", "Dealer is over 7.5");
    }
  }

  Player checkWinner() {
    if (playerController.score > 7.5 ||
        (dealerController.score >= playerController.score &&
            dealerController.score <= 7.5)) {
      gameStatus = GameStatus.dealerWin;
      // Get.snackbar("Dealer win", "Dealer win");
      return dealerController.player;
    } else if (dealerController.score > 7.5 ||
        (playerController.score > dealerController.score &&
            playerController.score <= 7.5)) {
      gameStatus = GameStatus.playerWin;
      // Get.snackbar("Player win", "Player win");
      return playerController.player;
    }
    return playerController.player;
  }

  void continueGame() {
    start(shuffle: deckController.deck.used.contains(jolly));
  }

  void restartGame() {
    start(shuffle: true);
  }
}
