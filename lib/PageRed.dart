import 'package:flutter/material.dart';

class PageRed extends StatefulWidget {
  PageRed({Key key, this.title, this.id}) : super(key: key);

  final String title;
  final String id;

  @override
  _PageRedState createState() => _PageRedState();
}

class _PageRedState extends State<PageRed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageRed'),
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
