import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyCell extends StatefulWidget {
  EasyCell(this.tilte,this.onTap,{Key? key}) : super(key: key);
  String tilte;
  VoidCallback? onTap;

  @override
  _EasyCellState createState() => _EasyCellState();
}

class _EasyCellState extends State<EasyCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: BSize.COMMON_CELL_HEIGHT,
      padding: BMargin.COMMON_LEFT_RIGHT_MARGIN,
      child: InkWell(
        child:      Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 0,
                child: Text(widget.tilte,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL))
            ),
            Positioned(
                right: 0,
                child: arrow()
            )
          ],
        ),
        onTap: widget.onTap,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR)),
        color: Colors.white,
      ),
    );
  }

  Widget arrow(){
    if(widget.onTap == null){
      return Container();
    }else{
      return Icon(Icons.keyboard_arrow_right_rounded,size: BSize.COMMON_BACK_ICON_SIZE);
    }
  }
}
