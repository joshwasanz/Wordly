import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
 


class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState()=> RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

   _buildList(){
    return ListView.builder(
  padding:  EdgeInsets.all(16.0),
  itemBuilder: (context, item) {
    if (item.isOdd) return Divider();

    final index = item ~/ 2;

    if(index >= _randomWordPairs.length){
      _randomWordPairs.addAll(generateWordPairs().take(10));
    }
    return _buildRow(_randomWordPairs[index]);
  },
);
}

Widget _buildRow(WordPair pair){
  final alreadySaved = _savedWordPairs.contains(pair);


  return ListTile(
    title: Text(pair.asPascalCase,
    style: TextStyle(
      fontSize: 18.0
    ),),
    trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, 
    color: alreadySaved? Colors.amber : null),
    onTap: (){
      setState(() {
        if(alreadySaved){
          _savedWordPairs.remove(pair);
        }else{
          _savedWordPairs.add(pair);
        }
      });
    },
  );
}

 Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Pair Generator"),
        backgroundColor: Colors.purple[900],
      ),
      body: _buildList(),
    );
  }
}