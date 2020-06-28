import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/main_screen/main_scree.dart';

import 'UI/ar_scan/scanner_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: "demo",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                color: Colors.purple,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen())),
                child: Center(
                  child: Text("Main menu"),
                )),
            FlatButton(
                color: Colors.purpleAccent,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen())),
                child: Center(
                  child: Text("Scan object"),
                ))
          ],
        ),
      ),
    );
  }
}
