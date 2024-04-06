import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:lexiquest/wordle.dart';
class HurdleProvider extends ChangeNotifier{
 final random = Random.secure();
 List<String> totalWords= [];
 List<String> rowInputs=[];
 List<String> excludedLetters = [];
 List<Wordle> hurdleBoard = [];
 String targetWord='';

 init (){
  totalWords = words.all.where((element) => element.length == 5 ).toList();
  generateBoard();
  generateRandomWord();

 }
 generateBoard(){

  hurdleBoard = List.generate(30, (index) => Wordle(letter: ''));
 }

 generateRandomWord(){
  targetWord=totalWords[random.nextInt(totalWords.length)].toUpperCase();
  print(targetWord);
 }
}