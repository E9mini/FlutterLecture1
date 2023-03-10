import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackAndToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Snack&Toast"),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  "Menu is Clicked",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            )
          },
        ),
      ),
      body: MyToastBar(),
    );
  }
}

class MyToastBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("ToastButton"),
        onPressed: () => {flutterToast()},
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: "Toast is Showed",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () => {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "MySnackBar",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        },
      ),
    );
  }
}