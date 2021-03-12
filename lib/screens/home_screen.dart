import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class MyItem {
  MyItem({this.isExpanded: false, this.header, this.body});

  bool isExpanded;
  final String header;
  final String body;
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _flag = true;
  Animation<double> _myAnimation;
  AnimationController _controller;

  List<MyItem> _items = <MyItem>[
    MyItem(header: 'header 1', body: 'body 1'),
    MyItem(header: 'header 2', body: 'body 2'),
    MyItem(header: 'header 3', body: 'body 3'),
    MyItem(header: 'header 4', body: 'body 4'),
    MyItem(header: 'header 5', body: 'body 5'),
    MyItem(header: 'header 6', body: 'body 6'),
    MyItem(header: 'header 7', body: 'body 7'),
  ];

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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 3,
          right: 3,
        ),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map((MyItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Icon(Icons.home),
                            SizedBox(
                              width: 10,
                            ),
                            Text(item.header),
                          ],
                        ),
                      ),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: Container(
                    child: Text(item.body),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
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
