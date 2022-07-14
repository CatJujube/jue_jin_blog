import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class EasyBubbleCell extends StatefulWidget {
  EasyBubbleCell(this.titles,this._selectedIndex,{Key? key}) : super(key: key);

  List<String> titles;
  int _selectedIndex;

  @override
  _EasyBubbleCellState createState() => _EasyBubbleCellState();
}

class _EasyBubbleCellState extends State<EasyBubbleCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: BSize.COMMON_CELL_HEIGHT,
      padding: EdgeInsets.only(top: 8,bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildBubbles(),
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR),bottom: BorderSide(width: 1,color: BColors.COMMON_GREY_BG_COLOR)),
        color: Colors.white,
      ),
    );
  }

  List<Widget> buildBubbles(){
    List<Widget> retList = [];
    for(int i=0;i<widget.titles.length;++i){
        retList.add(easyBubble(widget.titles[i], i, () { }));
    }
    return retList;
  }

  Widget easyBubble(String title,int index,VoidCallback onTap){
    return InkWell(
      child:       Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
        child: Text(title,style: TextStyle(color: widget._selectedIndex ==index ? Colors.blueAccent : Colors.grey,fontSize: BFontSize.FONT_SIZE_SAMLL),),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget._selectedIndex == index ? BColors.COMMON_BG_BLUE : BColors.COMMON_GREY_BG_COLOR
        ),
      ),
      onTap: (){
        setState(() {
          widget._selectedIndex = index;
        });
        onTap;
      },
    );
  }
  

}
