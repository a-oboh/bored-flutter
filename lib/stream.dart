import 'dart:async';

import 'package:flutter/material.dart';

class StreamTest extends StatefulWidget {
  StreamTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StreamTestState createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many times:',
            ),
             Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
