import 'package:flutter/material.dart';
import './random_words.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    // var wordPair = WordPair.random();
    return MaterialApp(
      home: RandomWords()
    );
  }
}

