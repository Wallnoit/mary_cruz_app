import 'dart:math';

import 'package:flutter/material.dart';

class GameLogic {
  final String hiddenCard = 'lib/assets/logo2.png';
  List<String>? cardsImg;
  String level = '';

  late List<String> card_list = [];
  late List<bool> isEnabled = [
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true /*, true, true, true,true, true, true, true, true, true, true*/
  ];

  var axiCount = 0;
  var cardCount = 0;
  List<Map<int, String>> matchCheck = [];

  void initGame(BuildContext context) {
    cardCount = 9; //16;
    axiCount = 3; //4;
    card_list = [
      'lib/assets/2dd50e12-9829-4460-ab85-12cd2df9f32e.JPG',
      'lib/assets/5a0a96ad-cbf9-4902-b997-224a519e285d.JPG',
      'lib/assets/a9dea6e8-7af5-4411-b49a-1c317124ba8f.JPG',
      'lib/assets/b470655f-0bec-4670-939e-c203b6d2d4ef.JPG',
      'lib/assets/logo2.png',
      'lib/assets/2dd50e12-9829-4460-ab85-12cd2df9f32e.JPG',
      'lib/assets/5a0a96ad-cbf9-4902-b997-224a519e285d.JPG',
      'lib/assets/a9dea6e8-7af5-4411-b49a-1c317124ba8f.JPG',
      'lib/assets/b470655f-0bec-4670-939e-c203b6d2d4ef.JPG',
      /*'lib/assets/logo2.png',
        'lib/assets/logo2.png',
        'lib/assets/logo2.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',
        'lib/assets/logo3.png',*/
    ];

    isEnabled = [
      true,
      true,
      true,
      true,
      false,
      true,
      true,
      true,
      true /*, true, true, true,true, true, true, true, true, true, true*/
    ];

    //card_list.shuffle();

    int fixedPosition = 4;
    String fixedElement = card_list[fixedPosition];

    // Crear una nueva lista sin el elemento fijo
    List<String> remainingCards = [
      ...card_list.sublist(0, fixedPosition),
      ...card_list.sublist(fixedPosition + 1),
    ];

    // Mezclar el resto de la lista
    remainingCards.shuffle(Random());

    // Volver a insertar el elemento fijo en su posición
    List<String> shuffledList = [
      ...remainingCards.sublist(0, fixedPosition),
      fixedElement,
      ...remainingCards.sublist(fixedPosition),
    ];

    card_list = shuffledList;

    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}
