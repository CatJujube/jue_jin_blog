import 'package:flutter/material.dart';

Widget picAndText(String imgpath,String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
          image: AssetImage(imgpath),
          fit: BoxFit.fill
      ),
    ),
    alignment: Alignment.center,
    child: Text(text),
  );
}
