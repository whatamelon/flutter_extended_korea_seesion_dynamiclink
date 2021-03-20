import 'dart:async';

import 'package:dlt/PageBlue.dart';
import 'package:dlt/PageRed.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class CorePage extends StatefulWidget {
  CorePage({
    Key key,
    this.data,
  }): super(key: key);

  final Map<String,dynamic> data;
  @override
  _CorePageState createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {

  String link = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      print(widget.data);
      if(widget.data.length != 0) {
        isThereLink();
      }
    });
  }

  isThereLink() async{
    Timer(Duration(milliseconds: 700), () async{
      switch(widget.data['route']){
        case 'red':
          Navigator.push(context,MaterialPageRoute(builder: (context) => PageRed(title: widget.data['route'], id: widget.data['id'],)));
          break;
        case 'blue':
          Navigator.push(context,MaterialPageRoute(builder: (context) => PageBlue(title: widget.data['route'], id: widget.data['id'],)));
          break;
        default:
          print('do not action');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Dynamic Link'),
        ),
        body: _buildBody()
    );
  }
  Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          SizedBox(height:  100,),
          Container(
            child: GestureDetector(
              onTap: _buildDynamicLink('blue','2020'),
              child: Text('buildDynamicLink!'),
            ),
          ),
          SizedBox(height:  50,),
          Text(link)
        ],
      ),
    );
  }


  _buildDynamicLink(target, id) {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://summerclout.page.link',
        link: Uri.parse('https://summerclout.page.link/?route=$target?id=$id'),
        androidParameters: AndroidParameters(
            packageName: 'com.session.dlt'
        ),
        iosParameters: IosParameters(
            bundleId: 'com.session.dlt'
        )
    );

    print(parameters);

    setState(() {
      link = parameters.toString();
    });
  }

}
