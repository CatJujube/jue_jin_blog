import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatefulWidget {
  RoundImage(this.url,this.radius,{Key? key}) : super(key: key);

  double radius;
  String url;
  @override
  _RoundImageState createState() => _RoundImageState();
}

class _RoundImageState extends State<RoundImage> {
  @override
  Widget build(BuildContext context) {
    return RoundImage(widget.radius, widget.url);
  }

  Widget RoundImage(double radius,String? url){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(radius)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(url ?? "",fit: BoxFit.fill,),
    );
  }
}
