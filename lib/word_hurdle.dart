import 'package:flutter/material.dart';
import 'package:lexiquest/hurdle_provider.dart';
import 'package:lexiquest/wordle_view.dart';
import 'package:provider/provider.dart';

import 'helper_function.dart';
import 'keyboard_view.dart';

class wordhurdlepage extends StatefulWidget {
  const wordhurdlepage({super.key});

  @override
  State<wordhurdlepage> createState() => _wordhurdlepageState();
}

class _wordhurdlepageState extends State<wordhurdlepage> {
  @override
  void didChangeDependencies() {
    Provider.of<HurdleProvider>(context, listen: false).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LexiQuest'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Consumer<HurdleProvider>(
                  builder: (context, provider, child) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: provider.hurdleBoard.length,
                    itemBuilder: (context, index) {
                      final wordle = provider.hurdleBoard[index];
                      return WordleView(wordle: wordle);
                    },
                  ),
                ),
              ),
            ),
            Consumer<HurdleProvider>(
              builder: (context, provider, child) => KeyboardView(
                excludedLetters: provider.excludedLetters,
                onPressed: (value) {
                  provider.inputLetter(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<HurdleProvider>(
                builder: (context, provider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        provider.deleteLetter();
                      },
                      child: const Text('Delete'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!provider.isAValidWord) {
                          showMsg(context, 'Not a valid word');
                          return;
                        }
                        if (provider.shouldCheckForAnswer) {
                          provider.checkAnswer();
                        }
                        if (provider.wins) {
                          showResult(
                            context: context,
                            title: 'You win',
                            body: 'The word was ${provider.targetWord}',
                            onPlayAgain: () {
                              Navigator.pop(context);
                              provider.reset();
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          );
                        } else if (provider.noAttemptsLeft) {
                          showResult(
                            context: context,
                            title: 'You Lost',
                            body: 'The word was ${provider.targetWord} ',
                            onPlayAgain: () {
                              Navigator.pop(context);
                              provider.reset();
                            },
                            onCancel: () {

                              Navigator.pop(context);
                            },
                          );
                        }
                      },
                      child: const Text('Submit'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//79
//80udemy
//83  10.16
//85 completed
//86
