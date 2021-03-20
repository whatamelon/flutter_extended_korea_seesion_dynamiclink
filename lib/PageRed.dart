import 'package:flutter/material.dart';

class PageRed extends StatefulWidget {
  PageRed({
    Key key,
    this.title,
    this.id
  }): super(key: key);

  final String title;
  final String id;


  @override
  _PageRedState createState() => _PageRedState();
}

class _PageRedState extends State<PageRed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PageRed'),
      ),
      body: _buildBody(),
    );
  }

 Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          Text(widget.title),
          Text(widget.id),
        ],
      ),
    );
 }
}
