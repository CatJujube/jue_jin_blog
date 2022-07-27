import 'package:flutter/cupertino.dart';

class EasyAvator{

  static Widget circleAvator(Widget? image,{double size = 64}){
    return
      ClipOval(
            child: Container(
              width: size,
              height: size,
              child: image,
            ),
        );
  }
}