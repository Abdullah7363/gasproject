import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';
//import 'package:photo_view/photo_view.dart';
class Zoomaimage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  InkWell(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Hero(
            tag: "imageHero",
            child: Container(
              height: 400,
              child: PhotoView(
                imageProvider: AssetImage("image/Document.jpg"),
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
          ),
        );
      },
    );
  },
  child: Container(
    height: 150,
    width: 150,
    child: Image.asset(
        "image/Document.jpg",
        fit: BoxFit.cover,
     ),
  ),
);
  }
}