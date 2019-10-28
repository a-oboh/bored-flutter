import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Play With Me! 😁'),
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
  TextEditingController input = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Test This!"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 250,
                    child: TextField(
                      key: Key('textfield'),
                      controller: input,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Done'),
                    onPressed: () {
                      setState(() {
                        text = input.text;
                      });
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
