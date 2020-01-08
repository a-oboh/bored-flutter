import 'package:Play_with_me/animated_drawer/provider/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedDrawerHome extends StatefulWidget {
  @override
  _AnimatedDrawerHomeState createState() => _AnimatedDrawerHomeState();
}

class _AnimatedDrawerHomeState extends State<AnimatedDrawerHome>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        Tween<double>(begin: 1, end: 0.8).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: DrawerProvider(),
        child: DrawerWidget(
          scaleAnimation: scaleAnimation,
        ));
  }
}

class DrawerWidget extends StatelessWidget {
  final Animation scaleAnimation;

  const DrawerWidget({
    Key key,
    this.scaleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawProvider = Provider.of<DrawerProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 400,
            color: Colors.red,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: 0,
            left: drawProvider.openDrawer == false ? 0 : width * 0.6,
            right: drawProvider.openDrawer == false ? 0 : width * -0.6,
            bottom: 0,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: GestureDetector(
                onTap: () {
                  drawProvider.changeDrawerState();
                },
                child: Material(
                  animationDuration: Duration(milliseconds: 500),
                  borderRadius: drawProvider.openDrawer == true
                      ? BorderRadius.all(Radius.circular(20))
                      : BorderRadius.all(Radius.circular(0)),
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            
                          ],
                        ),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
