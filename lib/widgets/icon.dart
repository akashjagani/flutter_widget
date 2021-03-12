import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  String str = """
  class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Button selectedButton = Button.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Headers().appBar(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          Headers().headerText(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButton = Button.one;
                                    });
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    width:
                                        MediaQuery.of(context).size.width / 3.7,
                                    decoration: BoxDecoration(
                                      color: selectedButton == Button.one
                                          ? Color(0xFFFFC46B)
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedButton == Button.one
                                              ? Colors.grey
                                              : Colors.transparent,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'All food',
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButton = Button.two;
                                    });
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    width:
                                        MediaQuery.of(context).size.width / 3.7,
                                    decoration: BoxDecoration(
                                      color: selectedButton == Button.two
                                          ? Color(0xFFFFC46B)
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedButton == Button.two
                                              ? Colors.grey
                                              : Colors.transparent,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Pizza',
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButton = Button.three;
                                    });
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    width:
                                        MediaQuery.of(context).size.width / 3.7,
                                    decoration: BoxDecoration(
                                      color: selectedButton == Button.three
                                          ? Color(0xFFFFC46B)
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedButton == Button.three
                                              ? Colors.grey
                                              : Colors.transparent,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Pasta',
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          MiddleHelpers().texFav(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                        ],
                      ),
                    ),
                    MiddleHelpers().dataFav(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          MiddleHelpers().texBusiness(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          MiddleHelpers().dataBusiness(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Footers().floatingActionButton(context),
    );
  }
}
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectableText(str),
    );
  }
}
