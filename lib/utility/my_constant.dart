
import 'package:boongung/scaffold/my_widget0.dart';
import 'package:boongung/widget/my_widget1.dart';
import 'package:boongung/widget/my_widget2.dart';
import 'package:boongung/widget/my_widget3.dart';
import 'package:boongung/widget/my_widget4.dart';
import 'package:boongung/widget/my_widget5.dart';
import 'package:flutter/material.dart';

class MyConstant {

  String urlList = 'https://rspo.cropslink.com/api/info/list.php';



  List<String> nameIcons = [
    'images/image0.png',
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    'images/image4.png',
    'images/image5.png'
  ];

  List<String> titleIcon = [
    'title0',
    'title1',
    'title2',
    'title3',
    'title4',
    'title5'
  ];

  List<Widget> myWidgets = [
    MyWidget0(),
    MyWidget1(),
    MyWidget2(),
    MyWidget3(),
    MyWidget4(),
    MyWidget5()
  ];

  MyConstant();
}


