import 'package:dlt/corePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getDynamicLink();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      print('');
      print('');
      print('------ 앱 resumed ------');
      print('');
      print('');
      FirebaseDynamicLinks.instance.onLink(onSuccess: (dynamiclink) async{
        var deeplink = dynamiclink?.link;

        String realDlink = deeplink.toString().replaceAll('%3D', '=');
        print(realDlink);

        int lastIdx = realDlink.lastIndexOf('/');
        String firstEdit = realDlink.substring(lastIdx+2);


        List<dynamic> splitList = firstEdit.split("?");
        Map<String,dynamic> _newMaps = {};

        for(var i = 0; i < splitList.length; i++) {
          _newMaps[splitList[i].split("=")[0]] = splitList[i].split("=")[1];
        }
        print(_newMaps);

        if(_newMaps == null) {
        } else if(_newMaps.length > 0) {

          navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CorePage(data: _newMaps,)), (Route<dynamic> route) => false);

        } else {
          print('else value');
        }

      });
    }

  }




  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  void getDynamicLink() async{
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri initialLink = data?.link;

    String realIlink = initialLink.toString().replaceAll('%3D', '=');
    print(realIlink);

    int lastIdx = realIlink.lastIndexOf('/');
    String firstEdit = realIlink.substring(lastIdx+2);

    if(initialLink != null) {
      List<dynamic> splitList = firstEdit.split("?");
      Map<String,dynamic> _newMaps = {};

      for(var i = 0; i < splitList.length; i++) {
        _newMaps[splitList[i].split("=")[0]] = splitList[i].split("=")[1];
      }

      if(_newMaps == null) {
      } else if(_newMaps.length > 0) {
        navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CorePage(data: _newMaps,)), (Route<dynamic> route) => false);
      } else {}

    } else {
      FirebaseDynamicLinks.instance.onLink(onSuccess: (dynamiclink) async{
        var deeplink = dynamiclink?.link;

        String realDlink = deeplink.toString().replaceAll('%3D', '=');
        print(realDlink);

        int lastIdx = realDlink.lastIndexOf('/');
        String firstEdit = realDlink.substring(lastIdx+2);


        List<dynamic> splitList = firstEdit.split("?");
        Map<String,dynamic> _newMaps = {};

        for(var i = 0; i < splitList.length; i++) {
          _newMaps[splitList[i].split("=")[0]] = splitList[i].split("=")[1];
        }
        print(_newMaps);

        if(_newMaps == null) {
        } else if(_newMaps.length > 0) {

          navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CorePage(data: _newMaps,)), (Route<dynamic> route) => false);

        } else {
          print('else value');
        }


      });
    }


  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Dynamic Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      navigatorKey: navigatorKey,
    );
  }


}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
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
          Text('Main Page'),
          SizedBox(height:  50,),
        ],
      ),
    );
 }

}



