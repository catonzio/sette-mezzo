import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/utils/constants.dart';

import '../models/card.dart';
import '../models/deck.dart';

class DeckController extends GetxController {
  final Deck deck;

  DeckController() : deck = Deck.generateCards();

  void preloadImages() {
    for (CardModel card in deck.cards) {
      precacheImage(AssetImage(card.imagePath), Get.context!, size: cardSize);
    }
  }

  void shuffle() {
    reset();
    deck.cards.shuffle();
  }

  void reset() {
    deck.cards.addAll(deck.used);
    deck.used.clear();
  }

  CardModel draw({bool isCover = true}) {
    CardModel card = deck.cards.removeLast();
    card.isCover = isCover;
    deck.used.add(card);
    return card;
  }
}
