import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/CommentsBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/home_pages/CommenDetailPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';

class CommentSubCard extends StatefulWidget {
  CommentSubCard(this._beans,{Key? key}) : super(key: key);

  List<CommentsBean> _beans;

  @override
  _CommentSubCardState createState() => _CommentSubCardState();
}

class _CommentSubCardState extends State<CommentSubCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BColors.COMMON_GREY_BG_COLOR,
      padding: EdgeInsets.all(8),
      child:
      IntrinsicHeight(
        child: Column(
          children: commentCardList(),
        ),
      )
    );
  }

  List<Widget> commentCardList(){
    List<Widget> retList = [];
    if(widget._beans.length > 2){
      retList.add(
        singleCard(widget._beans[0].observer.userName, widget._beans[0].comment)
      );
      retList.add(
          singleCard(widget._beans[1].observer.userName, widget._beans[1].comment)
      );
      retList.add(
          InkWell(
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "查看全部"+widget._beans.length.toString()+"条回复>",
                style: TextStyle(color: Colors.blue,
                    fontSize: BFontSize.FONT_SIZE_NORMAL
                ),
              ),
            ),
            onTap: (){
              NavUtils.navToEmptyPage(context, "详细评论页面");
            },
          )
      );
    }else{
      widget._beans.forEach((element) {
        retList.add(singleCard(element.observer.userName,element.comment));
      });
    }
    return retList;
  }

  Widget singleCard(String userName,String comment){
    return Container(
      child: Text.rich(
          TextSpan(
              children: [
                TextSpan(
                    text: userName,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: BFontSize.FONT_SIZE_SAMLL
                    )
                ),
                TextSpan(
                    text: " : "+comment,
                    style: TextStyle(
                        fontSize: BFontSize.FONT_SIZE_SAMLL
                    )
                )
              ]
          )),
    );
  }
}
