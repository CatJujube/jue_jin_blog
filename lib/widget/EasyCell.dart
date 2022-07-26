import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyCell extends StatefulWidget {
  EasyCell({Key? key,this.leftText,this.rightText,this.midText,this.bgColor=Colors.white,this.isShowArrow=true,this.onTap}) : super(key: key);
  String? leftText;
  String? midText;
  String? rightText;
  VoidCallback? onTap;
  Color bgColor;
  bool isShowArrow = true;

  @override
  _EasyCellState createState() => _EasyCellState();
}

class _EasyCellState extends State<EasyCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      child: Container(
        height: BSize.COMMON_CELL_HEIGHT,
        padding: BMargin.COMMON_LEFT_RIGHT_MARGIN,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgetList(),
          ),
          onTap: widget.onTap,
        ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR)),
          color: Colors.white,
        ),
      )
    );
  }

  List<Widget> widgetList(){
    List<Widget> list = [];
    if(widget.leftText != null){
      list.add(
          Align(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 200
              ),
              child: Text(widget.leftText!,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
            alignment: Alignment.centerLeft,
          )
      );
    }
    if(widget.midText != null){
      list.add(
          Align(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 100
              ),
              child: Text(widget.midText!,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
            alignment: Alignment.center,
          )
      );
    }

    list.add(
      Flexible(fit: FlexFit.tight,child:       SizedBox())
    );
    if(widget.rightText != null){
      list.add(
          Align(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 280
              ),
              child: Text(widget.rightText!,style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
            alignment: Alignment.centerRight,
          )
      );
    }

    list.add(
      Align(
        child: arrow(),
        alignment: Alignment.centerRight,
      )
    );
    return list;
  }

  Widget arrow(){
    if(!widget.isShowArrow){
      return Container();
    }else{
      return Container(
        margin: EdgeInsets.only(left: 8),
        child:         Icon(Icons.keyboard_arrow_right_rounded,size: BSize.COMMON_BACK_ICON_SIZE)
      );
    }
  }
}
