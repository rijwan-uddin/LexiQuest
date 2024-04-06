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
 int count = 0;
 final lettersPerRow = 5;
 int index = 0;
 bool wins = false;
 final totalAttempts = 6;
 int Attempts = 0;

  bool get shouldCheckForAnswer => rowInputs.length == lettersPerRow;

  bool get noAttemptsLeft => Attempts == totalAttempts;

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
 bool get isAValidWord => totalWords.contains(rowInputs.join('').toLowerCase());
 
 
 inputLetter(String letter){
  if(count < lettersPerRow){
   count++;

   rowInputs.add(letter);
   hurdleBoard[index] = Wordle(letter: letter);
   index++;
   print(rowInputs);
   notifyListeners();
  }


 }

  void deleteLetter() {
  if(rowInputs.isNotEmpty){
   rowInputs.removeAt(rowInputs.length -1);
   // print(rowInputs);
  }
  if(count > 0 ){

   hurdleBoard[index - 1]= Wordle(letter: '');
   count--;
   index--;
  }
  notifyListeners();
  }

  void checkAnswer() {
  final input = rowInputs.join('');
  if(targetWord == input){
   wins= true ;

   } else {
   _markLetterOnBoard();
   if(Attempts < totalAttempts){
    _goToNextRow();
   }
  }

  }

  void _markLetterOnBoard() {
  for(int i=0 ; i<hurdleBoard.length; i++){
   if(hurdleBoard[i].letter.isNotEmpty && targetWord.contains(hurdleBoard[i].letter)){
    hurdleBoard[i].existsInTarget = true;
   } else if(hurdleBoard[i].letter.isNotEmpty && !targetWord.contains(hurdleBoard[i].letter)){
    hurdleBoard[i].doesNotExistInTarget =true;
    excludedLetters.add(hurdleBoard[i].letter);
   }
  }
notifyListeners();
  }

  void _goToNextRow() {
  Attempts++;
  count = 0;
 rowInputs.clear();
  }
 reset(){
  count = 0;
  index = 0;
  rowInputs.clear();
  excludedLetters.clear();
  Attempts=0;
  wins = false;
  targetWord= '';
  generateBoard();
  generateRandomWord();
  notifyListeners();
 }
}
