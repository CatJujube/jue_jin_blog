import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/CommentsBean.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/util/TimeUtil.dart';

import 'CommentSubCard.dart';

class CommentCard extends StatefulWidget {
  CommentCard(this._bean,{Key? key}) : super(key: key);

  CommentsBean _bean;

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Column(
          children: [
            Container(
              child: userInfoCard(),
            ),
            Container(
              margin: EdgeInsets.only(left: 45,top: 8),
              child: Text(widget._bean.comment,maxLines: 5,),
            ),
            Container(
              margin: EdgeInsets.only(left: 45,top: 8),
              child: CommentSubCard(widget._bean.followComments),
            )
          ],
        ),
    );
  }

  Widget userInfoCard(){
    return Container(
      padding: EdgeInsets.only(top: 18),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget._bean.observer.headerUrl),
            backgroundColor: Colors.white,
            radius: BSize.COMMON_HEADER_SIZE,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                      child: IntrinsicWidth(
                        child:Row(
                          children: [

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 200,
                                maxWidth: 200
                              ),
                              child: Align(
                                child: Text(widget._bean.observer.userName,
                                    style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL,color: Colors.blue,fontWeight: FontWeight.w400),
                                    maxLines: 1,overflow: TextOverflow.ellipsis),
                                alignment: Alignment.centerLeft,
                              )
                             ),
                            Flexible(fit:FlexFit.tight,child: SizedBox()),
                            Container(
                              margin: EdgeInsets.only(left:20,right: 20),
                              child: Align(
                                child: Row(
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined,color: Colors.grey,size: 16),
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child:Text(widget._bean.startCount.toString(),style: TextStyle(color: BColors.COMMON_TEXT_GREY_DEEPER))
                                    )
                                  ],
                                ),
                                alignment: Alignment.centerRight,
                              ),
                            ),
                            Align(
                                child: Icon(Icons.messenger_outline,color: Colors.grey,size: 16),
                                alignment: Alignment.centerRight,
                              )
                          ],
                        ),
                      )
                ),
                Container(
                  child: Text(widget._bean.observer.workInfo + "    ·   "+TimeUtil.timeToBefore(widget._bean.commentTime),
                    style: TextStyle(color: BColors.COMMON_TEXT_GREY_DEEPER,fontSize: BFontSize.FONT_SIZE_SAMLL),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
