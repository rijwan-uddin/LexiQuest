import 'package:flutter/material.dart';
import 'package:lexiquest/hurdle_provider.dart';
import 'package:lexiquest/wordle_view.dart';
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
      ),
      ),
      body: Center(
        child:Column(
          children: [
            Expanded(
              child: Consumer<HurdleProvider>(
                builder: (context ,provider ,child) => GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing:4,
                    crossAxisSpacing:4,
                  ),
                  itemCount: provider.hurdleBoard.length,
                  itemBuilder: (context , index){
                    final wordle = provider.hurdleBoard [index];
                    return WordleView(wordle:wordle);
                  },
                ),
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
//79