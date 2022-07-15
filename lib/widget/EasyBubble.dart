import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';

class EasyBubble extends StatefulWidget {
  EasyBubble(this.title,{Key? key,
    this.textColor = Colors.blueAccent,
    this.onTap,
    this.rightIcon,
    this.radius=3,
    this.width = 64,
    this.height = 32,
  }) : super(key: key);

  Color textColor = Colors.blueAccent;
  Color backgroundColor = BColors.COMMON_BG_BLUE;
  VoidCallback? onTap;
  String title;
  Icon? rightIcon;
  double radius;
  double width;
  double height;
  @override
  _EasyBubbleState createState() => _EasyBubbleState();
}

class _EasyBubbleState extends State<EasyBubble> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title,style: TextStyle(color: widget.textColor,fontSize: BFontSize.FONT_SIZE_SAMLL),),
            Container(
              child: widget.rightIcon,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.backgroundColor
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
