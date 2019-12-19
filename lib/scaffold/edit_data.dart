import 'package:boongung/utility/my_constant.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  final int index;
  final String idArea;
  EditData({Key key, this.index, this.idArea}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  // Field
  int currentIndex;
  List<Widget> myWidgets = MyConstant().myWidgets;
  List<String> titleIcons = MyConstant().titleIcon;
  String areaIndex;

  // Method
  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    areaIndex = widget.idArea;
  }

  Widget showCurrentWidget(String id){
    Widget myWidget = myWidgets[currentIndex];
    return myWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data ${titleIcons[currentIndex]}'),
      ),
      body: myWidgets[currentIndex],
    );
  }
}
