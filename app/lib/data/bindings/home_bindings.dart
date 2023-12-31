import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/player_controller.dart';
import '../controllers/deck_controller.dart';
import '../controllers/game_controller.dart';
import '../models/player.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    
    PlayerController dealerController =
        Get.put(PlayerController(Player('Dealer')), tag: 'Dealer');
    PlayerController playerController =
        Get.put(PlayerController(Player('Player')), tag: 'Player');

    Get.put(GameController(
        deckController: Get.put(DeckController()),
        playerController: playerController,
        dealerController: dealerController));

  }
}
