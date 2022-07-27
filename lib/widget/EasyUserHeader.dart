import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/BlogBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/util/TimeUtil.dart';
import 'package:jue_jin_blog/widget/EasyBubble.dart';

class EasyUserHeader extends StatefulWidget {
  EasyUserHeader(this._blogBean,{Key? key}) : super(key: key);

  BlogBean _blogBean;
  @override
  _EasyUserHeaderState createState() => _EasyUserHeaderState();
}

class _EasyUserHeaderState extends State<EasyUserHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: BSize.BIG_CELL_HEIGHT,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget._blogBean.author.headerUrl ?? ""),
                backgroundColor: Colors.white,
                radius: BSize.COMMON_HEADER_SIZE,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(widget._blogBean.author.userName ?? "",
                        style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),
                      ),
                    ),
                    Container(
                      child: Text(TimeUtil.timeToBefore(widget._blogBean.createTime)+" | "+"阅读"+widget._blogBean.readNum.toString(),
                        style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),
                      ),
                    )
                  ],
                )
              )),
          Flexible(fit:FlexFit.tight,child:SizedBox()),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: EasyBubble("+ 关注",onTap: (){
                NavUtils.navToEmptyPage(context, "关注");
              },),
            ),
          )
        ],
      ),
    );
  }


}
