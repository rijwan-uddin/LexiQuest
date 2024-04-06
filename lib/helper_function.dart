import 'package:flutter/material.dart';
void showMsg(BuildContext context, String msg)=>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not a valid word')));



void showResult({
  required BuildContext context,
  required String title,
  required String body,
  required VoidCallback onPlayAgain,
  required VoidCallback onCancel,
}) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title:
    Text(title),
    content: Text(body),
    actions: [
      TextButton(
        onPressed: onCancel,
        child: const Text('Quit'),
      ),
      TextButton(
        onPressed: onPlayAgain,
        child: const Text('Play Again'),
      )
    ],
  ));



}