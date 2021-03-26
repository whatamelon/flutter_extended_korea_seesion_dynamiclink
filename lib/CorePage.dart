import 'dart:async';

import 'package:dlt/PageBlue.dart';
import 'package:dlt/PageRed.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class CorePage extends StatefulWidget {
  CorePage({Key key, this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  _CorePageState createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  String link = '';

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (widget.data.length > 0) {
        isThereLink();
      }
    });
  }

  isThereLink() async {
    Timer(Duration(milliseconds: 700), () async {
      /// do something!

      switch (widget.data['route']) {
        case 'red':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageRed(
                        title: widget.data['route'],
                        id: widget.data['id'],
                      )));
          break;
        case 'blue':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageBlue(
                        title: widget.data['route'],
                        id: widget.data['id'],
                      )));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        GestureDetector(
          onTap: () {
            final DynamicLinkParameters parameters = DynamicLinkParameters(
                uriPrefix: 'https://summerclout.page.link',
                link: Uri.parse(
                    'https://summerclout.page.link/?route=blue?id=2020'),
                androidParameters:
                    AndroidParameters(packageName: 'com.session.dlt'),
                iosParameters: IosParameters(
                  bundleId: 'com.session.dlt',
                ));

            setState(() {
              link = parameters.toString();
            });
          },
          child: Text('Tab!'),
        ),
      ],
    );
  }
}
