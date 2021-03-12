import 'package:flutter/material.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _flag = true;
  Animation<double> _myAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animationDuration:
    Duration(milliseconds: 300);
    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text('Flutter Catalog'),
      actions: [
        IconButton(
          icon: AnimatedIcon(
            progress: _myAnimation,
            icon: AnimatedIcons.menu_close,
          ),
          onPressed: () {
            if (_flag) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            _flag = !_flag;
          },
        ),
        IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
      ],
    );
  }
}
