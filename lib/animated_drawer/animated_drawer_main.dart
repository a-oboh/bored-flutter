import 'package:Play_with_me/animated_drawer/provider/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedDrawerHome extends StatefulWidget {
  @override
  _AnimatedDrawerHomeState createState() => _AnimatedDrawerHomeState();
}

class _AnimatedDrawerHomeState extends State<AnimatedDrawerHome>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: DrawerProvider(),
        child: DrawerWidget(
            // scaleAnimation: scaleAnimation,
            ));
  }
}

class DrawerWidget extends StatefulWidget {
  final Animation scaleAnimation;

  const DrawerWidget({Key key, this.scaleAnimation}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        Tween<double>(begin: 1, end: 0.95).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drawProvider = Provider.of<DrawerProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              color: Colors.red,
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: 0,
              left: drawProvider.openDrawer == false ? 0 : width * 0.5,
              right: drawProvider.openDrawer == false ? 0 : width * -0.5,
              bottom: 0,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: GestureDetector(
                  onTap: () {
                    drawProvider.closeDrawer();

                    _animationController.reverse();
                  },
                  child: Material(
                    color: Colors.blue,
                    animationDuration: Duration(milliseconds: 100),
                    borderRadius: drawProvider.openDrawer == true
                        ? BorderRadius.all(Radius.circular(15))
                        : BorderRadius.all(Radius.circular(0)),
                    child: Container(
                      child: ListView(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: AnimatedCrossFade(
                              crossFadeState: drawProvider.openDrawer == true
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: Duration(milliseconds: 200),
                              firstChild: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  drawProvider.changeDrawerState();

                                  drawProvider.openDrawer == true
                                      ? _animationController.forward()
                                      : _animationController.reverse();
                                },
                              ),
                              secondChild: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  drawProvider.changeDrawerState();

                                  drawProvider.openDrawer == true
                                      ? _animationController.forward()
                                      : _animationController.reverse();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
