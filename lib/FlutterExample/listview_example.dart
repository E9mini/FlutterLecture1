import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:english_words/english_words.dart';

// void main() => runApp(ListViewExample());

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final wordPair = WordPair.random();
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORD TEST"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: 20,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(); /*2*/
        // final index = i ~/ 2;
        final index = i;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(100));
        }
        return _buildRow(_suggestions[index]);
      },
      // separatorBuilder: (ctx, idx) {
      //   return Divider();
      // },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
