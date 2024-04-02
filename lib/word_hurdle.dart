import 'package:flutter/material.dart';

class wordhurdlepage extends StatefulWidget {
  const wordhurdlepage({super.key});

  @override
  State<wordhurdlepage> createState() => _wordhurdlepageState();
}

class _wordhurdlepageState extends State<wordhurdlepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'LexiQuest'
      ),),
    );
  }
}
