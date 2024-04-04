import 'package:flutter/material.dart';
import 'package:lexiquest/hurdle_provider.dart';
import 'package:provider/provider.dart';

class wordhurdlepage extends StatefulWidget {
  const wordhurdlepage({super.key});

  @override
  State<wordhurdlepage> createState() => _wordhurdlepageState();
}

class _wordhurdlepageState extends State<wordhurdlepage> {
  @override
  void didChangeDependencies() {
    Provider.of<HurdleProvider>(context,listen:false).init();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'LexiQuest'
      ),),
    );
  }
}
//79