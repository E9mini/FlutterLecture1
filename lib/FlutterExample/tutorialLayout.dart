import 'package:flutter/material.dart';
import 'favoriteWidget.dart';

class TutorialLayout extends StatelessWidget {
  const TutorialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).primaryColor;

    return MaterialApp(
      title: 'Flutter layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/lake.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Color.fromRGBO(255, 0, 0, 1), Icons.call, 'CALL'),
      _buildButtonColumn(Color.fromRGBO(255, 0, 0, 1), Icons.near_me, 'ROUTE'),
      _buildButtonColumn(Color.fromRGBO(255, 0, 0, 1), Icons.share, 'SHARE'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Oeschien Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
      FavoriteWidget(),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
