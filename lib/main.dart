import 'package:flutter/material.dart';

import 'UI/jobs/jobs.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOBS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'JOBS'),
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



  void _goToJobsPage() {
   Navigator.push(context, MaterialPageRoute<void>(builder: (context) => JobsPage()));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Main Menu'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToJobsPage,
        tooltip: 'Jobs',
        child: Icon(Icons.add),
      ),
    );
  }
}
