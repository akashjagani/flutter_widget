import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/const/const.dart';
import 'package:flutter_widget/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController controller = Get.put(HomeScreenController());

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
      color: Colors.deepPurpleAccent,
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
          controller.changeScreenSize();
        },
        child: AnimatedContainer(
          height: deviceSize.height,
          width: deviceSize.width,
          duration: Duration(milliseconds: 400),
          transform: Matrix4.translationValues(
              controller.xOffset.value, controller.yOffset.value, 0)
            ..scale(controller.scale.value),
          decoration: BoxDecoration(
            gradient: kHomeScreenGradient,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: () {
                        controller.changeScreenSize();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          controller.scale.value != 0.7
                              ? Icons.menu
                              : Icons.clear,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    Text('Learn Flutter'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
