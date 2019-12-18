import 'package:boongung/scaffold/edit_data.dart';
import 'package:boongung/utility/my_constant.dart';
import 'package:boongung/utility/my_style.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  final String id, name;
  MainHome({Key key, this.id, this.name}) : super(key: key);
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  // Field
  List<String> nameIcons = MyConstant().nameIcons;
  List<String> titleIcons = MyConstant().titleIcon;
  String currentId, currentName;

  // Method
  @override
  void initState() { 
    super.initState();
    currentId = widget.id;
    print('currentId = $currentId');
    currentName = widget.name;
  }


  Widget showImage(String nameIcon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3 - 40,
      child: Image.asset(nameIcon),
    );
  }

  Widget showTitle(String titleIcon) {
    return Text(
      titleIcon,
      style: MyStyle().titleH2,
    );
  }

  Widget showCard(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.3,
      child: GestureDetector(
        onTap: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext buildContext) {
            return EditData(index: index);
          });
          Navigator.of(context).push(materialPageRoute);
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showImage(nameIcons[index]),
              showTitle(titleIcons[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        showCard(0),
        showCard(1),
        showCard(2),
      ],
    );
  }

  Widget rowTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        showCard(3),
        showCard(4),
        showCard(5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$currentName Area'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            rowOne(),
            rowTwo(),
          ],
        ),
      ),
    );
  }
}
