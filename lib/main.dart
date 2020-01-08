import 'dart:async';
import 'package:Play_with_me/animated_drawer/animated_drawer_main.dart';
import 'package:Play_with_me/modal_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/animated-drawer',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: 'Play With Me! 😁'),
        '/modal-page': (context) => ModalPage(),
        '/animated-drawer': (context) => AnimatedDrawerHome(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: MyHomePage(title: 'Play With Me! 😁'),
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
  void initState() {
    genDynamicLink();
    super.initState();
  }

  genDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://relanceapp.page.link',
      link: Uri.parse('https://berthacks.com/'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.testapp',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'The title of this dynamic link',
        description: 'You could add a description too.',
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    print(dynamicUrl);
  }

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
                    key: Key('done'),
                    onPressed: () {
                      setState(() {
                        text = input.text;
                      });
                      Navigator.pushNamed(context, '/modal-page');
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
                key: Key('output'),
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
