import 'package:flutter/material.dart';

class ModalPage extends StatefulWidget {
  @override
  _ModalPageState createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ModalBarrier(dismissible: true, color: Colors.grey),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
