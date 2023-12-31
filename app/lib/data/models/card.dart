import 'package:get/get.dart';
import 'enums.dart';
import '../../utils/constants.dart';

class CardModel {
  final int number;
  final Seed seed;
  final double value;
  final String name;
  final String imagePath;

  final RxBool _isCover = true.obs;
  bool get isCover => _isCover.value;
  set isCover(bool value) => _isCover.value = value;

  CardModel({
    required this.number,
    required this.seed,
  })  : value = number < 8 ? number.toDouble() : 0.5,
        name = '$number of ${seed.name}',
        imagePath = '$cardsPath/${number}_${seed.name}.jpg';

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          seed == other.seed;

  @override
  int get hashCode => number.hashCode ^ seed.hashCode;
}

CardModel jolly = CardModel(number: 10, seed: Seed.denara);
bool isJolly(CardModel card) =>
    card.number == jolly.number && card.seed == jolly.seed;
