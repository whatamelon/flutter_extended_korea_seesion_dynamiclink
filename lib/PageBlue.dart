import 'package:flutter/material.dart';

class PageBlue extends StatefulWidget {
  PageBlue({Key key, this.title, this.id}) : super(key: key);

  final String title;
  final String id;

  @override
  _PageBlueState createState() => _PageBlueState();
}

class _PageBlueState extends State<PageBlue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageBlue'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(widget.title),
          SizedBox(
            height: 100,
          ),
          Text(widget.id)
        ],
      ),
    );
  }
}
