import 'dart:convert';

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
              Navigator.of(context).push(materialPageRoute);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show ListArea'),
      ),
      body: ids.length == 0 ? showProcess() : showListView(),
    );
  }
}
