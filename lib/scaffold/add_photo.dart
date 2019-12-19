import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  // Field
  File file;

  // Method

  Future<void> cameraOrGallery(ImageSource imageSource) async {
    var object = await ImagePicker.pickImage(
        source: imageSource, maxWidth: 800.0, maxHeight: 600.0);

    setState(() {
      file = object;
    });
  }

  Widget cameraButton() {
    return Expanded(
      child: RaisedButton.icon(
        icon: Icon(Icons.add_a_photo),
        label: Text('Camera'),
        onPressed: () {
          cameraOrGallery(ImageSource.camera);
        },
      ),
    );
  }

  Widget galleryButton() {
    return Expanded(
      child: RaisedButton.icon(
        icon: Icon(Icons.add_photo_alternate),
        label: Text('Gallery'),
        onPressed: () {
          cameraOrGallery(ImageSource.gallery);
        },
      ),
    );
  }

  Widget uploadButton() {
    return Expanded(
      child: RaisedButton.icon(
        icon: Icon(Icons.cloud_upload),
        label: Text('Upload'),
        onPressed: () {

          if (file == null) {
            print('Non Choose Image');
          } else {
            uploadThread();
          }

        },
      ),
    );
  }

  Future<void> uploadThread()async{

    String url = 'https://rspo.cropslink.com/api/info/saveFile.php';

    Random random = Random();
    int i = random.nextInt(10000);
    String nameFile = 'myPicture$i.jpg';
    print('nameFile = $nameFile');

    try {

      Map<String, dynamic> map = Map();
      map['file'] = UploadFileInfo(file, nameFile);
      FormData formData = FormData.from(map);

      Response response = await Dio().post(url, data: formData);
      print('response = $response');

      
    } catch (e) {
    }

  }

  Widget showButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            cameraButton(),
            uploadButton(),
            galleryButton(),
          ],
        ),
      ],
    );
  }

  Widget showPicture() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 70.0),
          width: MediaQuery.of(context).size.width,
          // color: Colors.grey,
          height: MediaQuery.of(context).size.height * 0.5,
          child: file == null
              ? Image.asset(
                  'images/picture.png',
                  fit: BoxFit.cover,
                )
              : Image.file(file),
        ),
      ],
    );
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(Icons.navigate_before),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            backButton(),
            showPicture(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
