import 'package:boongung/utility/my_constant.dart';
import 'package:boongung/utility/my_style.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  // Field
  List<String> nameIcons = MyConstant().nameIcons;
  List<String> titleIcons = MyConstant().titleIcon;

  // Method
  Widget showImage(String nameIcon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3 - 40,
      child: Image.asset(nameIcon),
    );
  }

  Widget showTitle(String titleIcon) {
    return Text(titleIcon, style: MyStyle().titleH2,);
  }

  Widget showCard(String nameIcon, String titleIcon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage(nameIcon),
            showTitle(titleIcon),
          ],
        ),
      ),
    );
  }

  Widget rowOne() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        showCard(nameIcons[0], titleIcons[0]),
        showCard(nameIcons[1], titleIcons[1]),
        showCard(nameIcons[2], titleIcons[2]),
      ],
    );
  }

   Widget rowTwo() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        showCard(nameIcons[3], titleIcons[3]),
        showCard(nameIcons[4], titleIcons[4]),
        showCard(nameIcons[5], titleIcons[5]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            rowOne(),rowTwo(),
          ],
        ),
      ),
    );
  }
}
