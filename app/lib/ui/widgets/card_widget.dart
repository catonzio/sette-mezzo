import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/data/models/card.dart';
import 'package:sette_e_mezzo/utils/constants.dart';

class CardWidget extends StatelessWidget {
  final CardModel? card;
  final double width;
  final double height;

  const CardWidget(
      {super.key,
      required this.card,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    if (card == null) {
      return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
        child: AutoSizeText(
          "No cards",
          style: context.textTheme.displaySmall,
          maxFontSize: context.textTheme.displaySmall!.fontSize ?? 50,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return Obx(() => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: width,
              height: height,
              // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              alignment: Alignment.center,
              child: card!.isCover
                  ? Image.asset("$cardsPath/cover.jpg")
                  : Image.asset(
                      card!.imagePath,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
            ),
          ));
    }
  }
}
