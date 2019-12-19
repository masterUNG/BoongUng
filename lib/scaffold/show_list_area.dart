import 'dart:convert';

import 'package:boongung/scaffold/add_photo.dart';
import 'package:boongung/scaffold/main_home.dart';
import 'package:boongung/utility/my_constant.dart';
import 'package:boongung/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ShowListArea extends StatefulWidget {
  @override
  _ShowListAreaState createState() => _ShowListAreaState();
}

class _ShowListAreaState extends State<ShowListArea> {
  // Field
  String urlPHP = MyConstant().urlList;
  List<String> ids = List();
  List<String> names = List();

  // Method
  @override
  void initState() {
    super.initState();
    readDataThread();
  }

  Future<void> readDataThread() async {
    // Remove All Member in Array
    if (ids.length != 0) {
      ids.removeWhere((String string) {
        return string != null;
      });

      names.removeWhere((String string) => string != null);
    }

    String myJSON = '{"owner":1}';

    Response response = await post(urlPHP, body: myJSON);
    var result = json.decode(response.body);
    print('result = $result');

    var myData = result['data'];
    print('myData = $myData');

    for (var map in myData) {
      setState(() {
        ids.add(map['id']);
        names.add(map['name']);
      });
    }
  }

  Widget showListView() {
    return ListView.builder(
      itemCount: ids.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return Container(
          height: 80.0,
          child: GestureDetector(
            onTap: () {
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext buildContext) {
                return MainHome(
                  id: ids[index],
                  name: names[index],
                );
              });
              Navigator.of(context).push(materialPageRoute).then((object) {
                print('Back to ShowList');
                readDataThread();
              });
            },
            child: Card(
              child: Text(
                names[index],
                style: MyStyle().titleH1,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget showProcess() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget menuAddPicture() {
    return ListTile(
      leading: Icon(Icons.add_a_photo),
      title: Text('Add Photo'),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext)=> AddPhoto());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          menuAddPicture(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
      appBar: AppBar(
        title: Text('Show ListArea'),
      ),
      body: ids.length == 0 ? showProcess() : showListView(),
    );
  }
}
