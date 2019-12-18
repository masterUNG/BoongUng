import 'package:boongung/utility/my_constant.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  final int index;
  EditData({Key key, this.index}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  // Field
  int currentIndex;
  List<Widget> myWidgets = MyConstant().myWidgets;

  // Method
  @override
  void initState() { 
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: myWidgets[currentIndex],
    );
  }
}
