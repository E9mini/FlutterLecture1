import 'dart:ffi';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/BakFolder/snack_bar.dart';

class introductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        elevation: 0.0,
        leading: IconButton(
          color: Colors.white,
          onPressed: null,
          icon: Icon(Icons.menu),
          tooltip: "Menu",
        ),
        title: Text(
          "Example title",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.red,
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Search",
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 0.0, 0.0),
                ),
                Counter(),
              ],
            ),
            ShoppingList(<Product>[
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          print("HA"),
        },
        tooltip: "add",
        child: Icon(Icons.add),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList(this.products);

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.remove(product);
      else
        _shoppingCart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      physics:ScrollPhysics(),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        // widget.products.map((Product product) {
        return ShoppingListItem(
          widget.products[index],
          _shoppingCart.contains(widget.products[index]),
          _handleCartChanged,
        );
        // }).toList();
      },
    );
  }
}

class Product {
  Product(this.name);

  String name;
  Int? price;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(Product product, this.inCart, this.onCartChanged)
      : this.product = product,
        super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    //context가 필요한가?
    if (!inCart) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {
        onCartChanged(product, inCart),
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

// TEST
class TestGestureItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        print("MyButton is Tapped"),
      },
      onDoubleTap: () => {
        print("MyButton is Dobule Tapped"),
      },
      onLongPress: () => {
        print("MyButton is Long Tapped"),
      },
      onLongPressDown: (details) => {
        print('x:' + details.localPosition.dx.toString()),
        print("x:${details.localPosition.dx}"),
        print('y:' + details.localPosition.dy.toString()),
        print("y:${details.localPosition.dy.runtimeType}"),
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightGreen[500]),
        child: Center(child: Text('Engage')),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay(this.count);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text("Count : $count");
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor(this.onPressed, this.icon);

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      onPressed: onPressed,
      icon: this.icon,
      label: Text(""),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final int _maxCounter = 5;
  int _counter = 0;
  void _increment() {
    if (_counter < _maxCounter) {
      setState(() {
        _counter++;
        print(_counter);
      });
    }
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        print(_counter);
      });
    }
  }

  Icon plusIcon = Icon(
    Icons.add,
    color: Colors.black,
  );

  Icon minusIcon = Icon(
    Icons.remove,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterDisplay(_counter),
        CounterIncrementor(_increment, this.plusIcon),
        CounterIncrementor(_decrement, this.minusIcon),
      ],
    );
  }
}
