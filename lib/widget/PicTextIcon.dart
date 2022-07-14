import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicTextIcon extends StatefulWidget {
  PicTextIcon(this.text,this.imgPath,{Key? key,this.size=24}) : super(key: key);

  double size;
  String imgPath;
  String text;

  @override
  _PicTextIconState createState() => _PicTextIconState();
}

class _PicTextIconState extends State<PicTextIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(widget.imgPath),
            fit: BoxFit.fill
        ),
      ),
      alignment: Alignment.center,
      child: Text(widget.text,style: TextStyle(color: widget.imgPath.isEmpty ? Colors.grey : Colors.white,fontWeight: FontWeight.w500),maxLines: 1,),
    );
  }
}
