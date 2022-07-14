import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyButton extends StatefulWidget {
  EasyButton(this.title,this.onTap,{Key? key,
    this.textColor=Colors.white,
    this.backgroundColor=Colors.pinkAccent,
    this.fontSize =  BFontSize.FONT_SIZE_NORMAL,
    this.width = double.infinity,
    this.height = BSize.COMMON_CELL_HEIGHT,
    this.isBlod = false,
    this.enable = true
  }) : super(key: key);

  VoidCallback? onTap =  (){};
  String title = "";
  Color textColor = Colors.white;
  Color backgroundColor = Colors.pinkAccent;
  double fontSize = BFontSize.FONT_SIZE_NORMAL;
  double width = double.infinity;
  double height = BSize.COMMON_CELL_HEIGHT;
  bool isBlod;
  bool enable;
  @override
  _EasyButtonState createState() => _EasyButtonState();
}

class _EasyButtonState extends State<EasyButton> {
  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(constraints: BoxConstraints(
          minWidth: widget.width,
          minHeight: widget.height
      ),
        child: ElevatedButton(
          onPressed: widget.enable ? widget.onTap:null,
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.textColor,
                fontWeight: widget.isBlod? FontWeight.bold : FontWeight.normal,
                fontSize: widget.fontSize
            ),
          ),
          style: ButtonStyle(
            backgroundColor:widget.enable ? MaterialStateProperty.all(widget.backgroundColor):MaterialStateProperty.all(widget.backgroundColor.withOpacity(0.5)),
          ),
        ),
      );
  }
}
