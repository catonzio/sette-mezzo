import 'package:get/get.dart';

import '../models/card.dart';
import '../models/deck.dart';

class DeckController extends GetxController {
  final Deck deck;

  DeckController() : deck = Deck.generateCards();

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
