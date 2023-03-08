import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_1/FlutterExample/introductionWidget.dart';

class wordListView extends StatefulWidget {
  wordListView({super.key});

  int maxCounter = 50;
  int counter = 3;
/*
1. :현재 개수 label, + 버튼, - 버튼
2. :ListView WordCart
*/
  @override
  State<wordListView> createState() => _wordListViewState();
}

class _wordListViewState extends State<wordListView> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        title: Text(""),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: WordCountDisplay(widget.counter),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ShoppingList(<Product>[
                  Product("Eggs"),
                  Product("Flour"),
                  Product("Chocolate chips"),
                  Product("Flour"),
                  Product("Apple"),
                  Product("Eggs"),
                  Product("Flour"),
                  Product("Chocolate chips"),
                  Product("Flour"),
                  Product("Apple"),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: WordCounter(),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton(Icon inputIcon, VoidCallback? inputOnPressed)
      : this.icon = inputIcon,
        this.onPressed = inputOnPressed;

  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: this.icon,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
    );
  }
}

class WordCountDisplay extends StatelessWidget {
  WordCountDisplay(this.count);

  final int count;
  int item = 1;
  @override
  Widget build(BuildContext context) {
    return Text("Word : $item");
  }
}

class WordCounter extends StatefulWidget {
  @override
  State<WordCounter> createState() => _WordCounterState();
}

class _WordCounterState extends State<WordCounter> {
  int _counter = 0;
  int _maxCounter = 50;

  void _increment() {
    if (_counter < _maxCounter) {
      setState(() {
        _counter++;
        print(_counter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        Icon(
          Icons.add,
          color: Colors.black,
        ),
        _increment);
  }
}
