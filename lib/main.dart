import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Play With Me! 😁'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final StreamController ctrl = StreamController();

    
    // Initialize a listener that prints the data
    ctrl.stream.listen((data) {
      print("recieved data: $data");
    }, onDone: () {
      print("Stream done");
    }, onError: () {
      print("Error occured");
    });

    // We here add the data that will flow inside the stream    
    ctrl.sink.add('my name');
    ctrl.sink.add(1234);
    ctrl.sink.add({'a': 'element A', 'b': 'element B'});
    ctrl.sink.add(123.45);

    // Close the StreamController when finished
    ctrl.close();
  }

  Future<String> inputData() async {
    print("Fetched Data");
    return "This a test data";
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
