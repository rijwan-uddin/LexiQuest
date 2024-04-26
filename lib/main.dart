import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lexiquest/hurdle_provider.dart';
import 'package:lexiquest/word_hurdle.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: ( context) => HurdleProvider() ,
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lexiquest',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: const wordhurdlepage(),
    );
  }
}


