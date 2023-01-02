import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: const [
              Flexible(
                child: TextScroll(
                  'This is the sample text for Flutter TextScroll widget. This is the sample text for Flutter TextScroll widget.',
                  intervalSpaces: 10,
                  velocity: Velocity(pixelsPerSecond: Offset(30, 0)),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}





