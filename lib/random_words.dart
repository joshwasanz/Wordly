import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = <WordPair>{};

    @override
      Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Word Pair Generator",)),
        actions: <Widget>[
          IconButton(
            icon : const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
        backgroundColor: Colors.purple[800],
      ),
      body: _buildList(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair){
          return ListTile(
            title: Text(pair.asPascalCase,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w900
            )),
          );
        });
        final List<Widget> divided = ListTile.divideTiles(
          context:context,
          tiles: tiles  
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text("Saved WordPair"),
              backgroundColor: Colors.purple[800],
            ),
            body: ListView(children: divided),
          );
      })
    );
  }
  _buildList(){
    return ListView.builder(itemBuilder: (context,item){
      if (item.isOdd) return const Divider();    

      final index = item ~/ 2;

      if(item >= _randomWordPairs.length){
        _randomWordPairs.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_randomWordPairs[index]);
    });
  }
  
  _buildRow(WordPair pair){
    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
    title: Text(pair.asPascalCase, 
    style: const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 18.0
    ),),
    trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, 
    color: alreadySaved? Colors.red[500] : null),
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


}
    
  


