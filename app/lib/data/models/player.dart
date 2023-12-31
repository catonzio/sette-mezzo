import 'package:get/get.dart';

import 'card.dart';

class Player {
  String name;

  final RxDouble _score = 0.0.obs;
  get score => _score.value;
  set score(value) => _score.value = value;

  final RxList<CardModel> cards = <CardModel>[].obs;

  Player(this.name);
}
