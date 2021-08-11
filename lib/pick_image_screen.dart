import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:core';

import 'package:pick_image_demo/utils/ImagePickerView.dart';

class PickImageClass extends StatefulWidget {
  @override
  _PickImageClassState createState() => _PickImageClassState();
}

class _PickImageClassState extends State<PickImageClass> {
  File? pickedImgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image'),
      ),
      body: pickImageView(),
    );
  }

  Widget pickImageView() {
    return Center(
      child: InkWell(
        child: Column(
          children: [
            if (pickedImgFile == null)
              Image(
                image: AssetImage('images/ic_profile.jpeg'),
                width: 100,
                height: 100,
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                  pickedImgFile!,
                  width: 100,
                  height: 100,
                ),
              ),
          ],
        ),
        onTap: () {
          ImagePickerView().showChooseImagePicker(
              context, onTap(ImageSource.gallery), onTap(ImageSource.camera));
        },
      ),
    );
  }

  Function onTap(ImageSource source) {
    return () {
      getPickImage(source);
    };
  }

  getPickImage(ImageSource source) {
    ImagePickerView().pickImage(source).then((value) => setState(() {
          if (value != null) {
            pickedImgFile = File(value.path);
          }
        }));
  }
}
