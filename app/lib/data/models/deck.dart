import 'package:get/get.dart';

import 'card.dart';
import 'enums.dart';

class Deck {
  final RxList<CardModel> _cards = <CardModel>[].obs;
  RxList<CardModel> get cards => _cards;
  set cards(value) => _cards.value = value;

  final RxList<CardModel> _used = <CardModel>[].obs;
  RxList<CardModel> get used => _used;
  set used(value) => _used.value = value;

  Deck();

  factory Deck.generateCards() {
    Deck deck = Deck();
    deck.cards = [
      for (var seed in Seed.values)
        for (int i = 1; i < 11; i++) CardModel(number: i, seed: seed)
    ];
    return deck;
  }
}
