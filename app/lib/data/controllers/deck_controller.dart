import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/utils/constants.dart';
import 'dart:math' as math;

import '../../utils/utils.dart';
import '../models/card.dart';
import '../models/deck.dart';

class DeckController extends GetxController {
  final Deck deck;
  late List<double> angles;

  DeckController() : deck = Deck.generateCards();

  void preloadImages() {
    for (CardModel card in deck.cards) {
      precacheImage(AssetImage(card.imagePath), Get.context!, size: cardSize);
    }
  }

  @override
  void onInit() {
    super.onInit();
    math.Random source = math.Random();
    angles = List.generate(deck.cards.length,
        (index) => doubleInRange(source, -0.05, 0.05) * math.pi);
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
