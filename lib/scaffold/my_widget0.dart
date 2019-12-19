import 'dart:convert';

import 'package:boongung/models/edit_model.dart';
import 'package:boongung/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyWidget0 extends StatefulWidget {
  final int idTitle;
  final String idArea;
  MyWidget0({Key key, this.idArea, this.idTitle}) : super(key: key);
  @override
  _MyWidget0State createState() => _MyWidget0State();
}

class _MyWidget0State extends State<MyWidget0> {
  // Field
  String areaId;
  int titleId;
  InfoModel infoModel;
  List<String> valueInfo = List();
  final formKey = GlobalKey<FormState>();
  bool statusEdit = true;

  // Method
  @override
  void initState() {
    super.initState();
    areaId = widget.idArea;
    titleId = widget.idTitle;
    readDataThread();
  }

  Future<void> editDialog(String string, int index) async {
    String result = string;
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: Text('Edit Value'),
            content: Form(key: formKey,
              child: TextFormField(
                onSaved: (String string) {
                  result = string;
                },
                initialValue: string,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Edit'),
                onPressed: () {
                  statusEdit = false;
                  formKey.currentState.save();
                  print('result ===>>> $result');
                  setState(() {
                    valueInfo[index] = result;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> readDataThread() async {
    print('arraId ========>>>>> $areaId');

    String url = 'https://rspo.cropslink.com/api/info/view.php';
    Map<String, String> map = Map();
    map['id'] = areaId;
    print('map ===============>>> ${map.toString()}');

    String test = '{"id":$areaId}';

    Response response = await post(url, body: test);
    var object = json.decode(response.body);
    print('object = $object');

    var result = object['data'];
    print('result ====>>> $result');

    List<String> keyInfo = [
      'id',
      'owner',
      'name',
      'address',
      'type',
      'yearin',
      'area',
      'num',
      'dead',
      'growback',
      'yeargrow',
      'solutiongrow',
      'reasondead',
      'detailarea',
      'benefitother',
      'conserve',
      'coordinate',
      'statesoil',
      'typearea',
      'typearearemark',
      'typesoil',
      'typesoilother',
      'plantingarea',
      'plantingareaother',
      'soilconservation',
      'soilconservationother',
      'wateringmethod',
      'sourcewater',
      'usebefore',
      'pattern',
      'phase',
      'harvesting',
      'harvestingother',
      'originsoil',
      'originsoilother',
      'kindsoil',
      'kindsoilcompany',
      'choosesoil',
      'oldsoil',
      'pic_other',
      'pic_useful',
      'pic_gps',
      'gps',
      'datein',
      'code',
      'rspocode',
      'staffcode'
    ];

    int i = 0;
    for (var string in keyInfo) {
      valueInfo.add(result[string]);
      print('valueInfo[$i] ==> ${valueInfo[i]}');
      i++;
    }

    setState(() {
      infoModel = InfoModel.fromJson(result);
    });
  }

  Widget showName() {
    return ListTile(
      title: Text(valueInfo[2]),
      trailing: IconButton(
        icon: Icon(Icons.android),
        onPressed: () {
          print('Click Name');
          editDialog(valueInfo[2], 2);
        },
      ),
    );
  }

  Widget showAddress() {
    return ListTile(
      title: Text(infoModel.address),
      trailing: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
      ),
    );
  }

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget editButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),onPressed: (){
        editThread();
      },
    );
  }

  Future<void> editThread()async{

    if (statusEdit) {
      // Not Change
      print('Not Change');
    } else {

      String string = '{"id":1,"state":1,"name":"${valueInfo[2]}","code":"P001","rspocode":"RSPO01","address":"", "type":"1","yearin":"2554","area":"30","num":"300","dead":"3", "growback":"3","yeargrow":"2555", "solutiongrow":"", "reasondead":"หนอนกนิ ","detailarea":"ไมส้ น", "benefitother":"สวนยาง", "conserve":"ไมม่ " , "datein":"01/05/2560"}';
      String url = 'https://rspo.cropslink.com/api/info/update.php';

      Response response = await post(url, body: string);

      var map = json.decode(response.body);
      var result = map['status'];

      print('result = ${result['message']}');
      



    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[editButton()],
        title: Text('Widget 0'),
      ),
      body: infoModel == null
          ? showProgress()
          : ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                showName(),
                showAddress(),
              ],
            ),
    );
  }
}
