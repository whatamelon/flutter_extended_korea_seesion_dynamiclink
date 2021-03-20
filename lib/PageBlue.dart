import 'package:flutter/material.dart';

class PageBlue extends StatefulWidget {
  PageBlue({
    Key key,
    this.title,
    this.id
  }): super(key: key);

  final String title;
  final String id;


  @override
  _PageBlueState createState() => _PageBlueState();
}

class _PageBlueState extends State<PageBlue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PageBlue'),
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
