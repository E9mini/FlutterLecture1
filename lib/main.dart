import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'FlutterExample/listview_example.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'FlutterExample/introductionWidget.dart';
import 'FlutterExample/wordListView.dart';
import 'FlutterExample/tutorialLayout.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      theme: ThemeData(primarySwatch: Colors.red),
      // home: ListViewExample(),
      home: wordListView(),
    );
  }
}

