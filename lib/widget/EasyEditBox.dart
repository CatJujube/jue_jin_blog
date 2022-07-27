import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyEditBox extends StatefulWidget {
  EasyEditBox(this.controller,{Key? key,
    this.hintText="",
    this.width=double.infinity,
    this.height= BSize.COMMON_CELL_HEIGHT,
    this.radius = 5,
    this.autoFocus = true,
    this.onChanged
  }) : super(key: key);

  String hintText;
  double width;
  double height;
  TextEditingController controller;
  double radius;
  bool autoFocus;
  ValueChanged<String>? onChanged;

  @override
  _EasyEditBoxState createState() => _EasyEditBoxState();
}

class _EasyEditBoxState extends State<EasyEditBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide.none),
        ),
        controller: widget.controller,
        autofocus: widget.autoFocus,
        onChanged: widget.onChanged,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: BColors.COMMON_GREY_BG_COLOR,
      ),
    );
  }
}
