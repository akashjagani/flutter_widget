import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurpleAccent,
            ),
            _backEndContainer(deviceSize),
            _animatedContainer(deviceSize, context),
          ],
        ),
      ),
    );
  }

  Container _backEndContainer(Size deviceSize) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.only(top: 10),
      height: deviceSize.height,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _drawerListTile(
                title: 'Hello',
                onClick: () {},
              ),
              _dividerStyle(),
              _drawerListTile(
                title: 'Akash',
                onClick: () {},
              ),
              _dividerStyle(),
              _drawerListTile(
                title: 'Jagani',
                onClick: () {},
              ),
              _dividerStyle(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _dividerStyle() {
    return SizedBox(
      width: 250,
      child: Divider(
        height: 10,
        color: Colors.black,
      ),
    );
  }

  ListTile _drawerListTile({String title, Function onClick}) {
    return ListTile(
      onTap: onClick,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    );
  }

  Obx _animatedContainer(Size deviceSize, BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          // controller.changeScreenSize();
        },
        child: AnimatedContainer(
          height: deviceSize.height,
          width: deviceSize.width,
          duration: Duration(milliseconds: 400),
          transform: Matrix4.translationValues(
              controller.xOffset.value, controller.yOffset.value, 0)
            ..scale(controller.scale.value),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: InkResponse(
                onTap: () {
                  controller.changeScreenSize();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    controller.scale.value != 0.7 ? Icons.menu : Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Flutter Widget',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                InkResponse(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 25,
                    ),
                    child: Container(
                      height: deviceSize.height / 6.5,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: Column(
                              children: [
                                CircleContainer(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Test',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Container(
                      height: deviceSize.height / 2,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: ContainerCard(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildOriginDesign(),
          ),
        ),
      ),
    );
  }

  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.search),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.account_circle),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        print('Tapped');
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
