
import 'package:flutter/material.dart';

class GameLogic {
  final String hiddenCard = 'lib/assets/logo.png';
  List<String>? cardsImg;
  String level = '';

  late List<String> card_list = [];
  late List<bool> isEnabled = [true, true, true, true, true, true,true, true, true, true, true, true,true, true, true, true, true, true, true];

  var axiCount = 0;
  var cardCount = 0;
  List<Map<int, String>> matchCheck = [];
  //  List<Map<int, String>> matchCheck = [];


  void initGame(BuildContext context) {
    
      cardCount = 16;
      axiCount = 4;
      card_list = [
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo2.png',
        'lib/assets/logo2.png',
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
      ];


    isEnabled = [true, true, true, true, true, true,true, true, true, true, true, true,true, true, true, true, true, true, true];

    
    card_list.shuffle();
    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}


class SaveClickInfo{
  int index;
  String nameUrl;

   SaveClickInfo(this.index,
            this.nameUrl
  );


}