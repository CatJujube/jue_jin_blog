import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jue_jin_blog/asset/NetAssets.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/net/service/UserService.dart';
import 'package:jue_jin_blog/pages/login_register/LoginRegisterPage.dart';
import 'package:jue_jin_blog/pages/mine_info_pages/SettingPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';

class MoreFunctionIconData{
  String localIcon = "";
  String title = "";
  VoidCallback? onTap;
  MoreFunctionIconData(this.localIcon, this.title, this.onTap);
}

class MineInfoPage extends StatefulWidget {
  MineInfoPage(this.bean, this.isLogin,{Key? key}) : super(key: key);

  UserBean? bean;
  bool isLogin;


  @override
  _MineInfoPageState createState() => _MineInfoPageState();
}

class _MineInfoPageState extends State<MineInfoPage> {
  double actionIconSize = 22;
  double commonLeftMargin = BSize.COMMON_LEFT_SPAN;
  double commonRightMargin = BSize.COMMON_RIGHT_SPAN;

  double avatorTopMargin = 16;
  double avatorBottomMargin = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
      appBar: appBar(),
      body: body()
    );
  }

  AppBar appBar(){
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      actions: [
        actionIcon("lib/images/mine_info/ic_moon.png",(){
          NavUtils.navToEmptyPage(context, "暗黑风格切换");
        }),
        actionIcon("lib/images/mine_info/ic_bell_ring.png",(){
          NavUtils.navToEmptyPage(context, "提醒");
        }),
        actionIcon("lib/images/mine_info/ic_setting.png",(){
          NavUtils.navTo(context, SettingPage(UserBean.mockData(),UserService.isLogin()));
        })
      ],
    );
  }

  Widget actionIcon(String imgPath,VoidCallback? onTap){
    return IconButton(
        onPressed: onTap,
        icon: ImageIcon(AssetImage(imgPath),color: Colors.grey[600],),
        iconSize: actionIconSize,
        padding: EdgeInsets.all(0),
    );
  }

  Widget avatorCell(){
    if(widget.isLogin){
      return Container(
          margin: EdgeInsets.only(left:10,top:avatorTopMargin,bottom:avatorBottomMargin,),
          child: GestureDetector(
            onTap: (){
              NavUtils.navToEmptyPage(context, "个人主页");
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(widget.bean?.headerUrl ?? NetAssets.default_avator_url),
                  radius: 28,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        child: Text(widget.bean?.userName ?? "",
                          style: TextStyle(fontSize: BFontSize.FONT_SIZE_BIG,fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Row(
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          )
      );
    }else{
      return Container(
        margin: EdgeInsets.only(left:10,top:avatorTopMargin,bottom:avatorBottomMargin,),
        child: GestureDetector(
          onTap: (){
            NavUtils.navTo(context, LoginRegisterPage());
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("lib/images/mine_info/empty_avatar_user.webp"),
                radius: 28,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text("登录/注册",style: TextStyle(fontSize: BFontSize.FONT_SIZE_BIG,fontWeight: FontWeight.w500),),
              )
            ],
          ),
        )
      );
    }
  }

  Widget body(){
    return Container(
        margin: EdgeInsets.only(left: commonLeftMargin,right: commonRightMargin),
        color: BColors.COMMON_GREY_BG_COLOR,
        child: ListView(
          shrinkWrap: true,
          children: [
            avatorCell(),
            likeColFollowCell(),
            cardCell(5),
            creatorCenterCard(),
            moreFunctionCell()
          ],
        )
    );
  }

  Widget likeColFollowCell(){
    return Container(
      margin: EdgeInsets.only(bottom: 16,top:10),
      child: Row(
        children: [
          Expanded(flex:1,child: upDownMessage(widget.bean?.likeCount.toString() ?? "0", "点赞")),
          Expanded(flex:1,child: upDownMessage(widget.bean?.followerCount.toString() ?? "0", "收藏")),
          Expanded(flex:1,child: upDownMessage(widget.bean?.followerCount.toString() ?? "0", "关注")),
        ],
      ),
    );
  }

  Widget upDownMessage(String upText,String downText){
    return Container(
        child: Column(
          children: [
            Text(upText,style: TextStyle(fontSize: BFontSize.FONT_SIZE_MAXIMUM,color: Colors.black),),
            Text(downText,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL,color: Colors.black),)
          ],
        ),
    );
  }

  Widget cardCell(double cardRadius){
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cardRadius))
        ),
        child: Container(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child:       Row(
            children: [
              Expanded(flex: 1,child:iconTitleCell("lib/images/mine_info/ic_user_sign.webp", "每日签到", () { })),
              Expanded(flex: 1,child:iconTitleCell("lib/images/mine_info/ic_user_luck.webp", "幸运转盘", () { })),
              Expanded(flex: 1,child:iconTitleCell("lib/images/mine_info/ic_user_bug.webp", "收集bug", () { })),
              Expanded(flex: 1,child:iconTitleCell("lib/images/mine_info/ic_user_change.webp", "福利兑换", () { })),
            ],
          ),
        )
      ),
    );
  }

  Widget iconTitleCell(String icon,String title,VoidCallback? onTap){
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image(image: AssetImage(icon),width: 32,),
          ),
          Text(title,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLL),)
        ],
      ),
    );
  }

  Widget iconTitleCell2(String icon,String title,VoidCallback? onTap){
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: ImageIcon(AssetImage(icon),size: 24,color: Colors.black,),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(title,style: TextStyle(fontSize: BFontSize.FONT_SIZE_SAMLLEST),),
          )
        ],
      ),
    );
  }

  List<MoreFunctionIconData> allList = [
    MoreFunctionIconData("lib/images/mine_info/ic_user_course.png", "我的课程", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_popularize.png", "推广中心", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_creator.png", "创作者中心", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_pins.png", "我的圈子", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_history.png", "阅读记录", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_tag.png", "标签管理", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_suggest.png", "意见反馈", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_resume.png", "简历管理", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_suggest.png", "意见反馈", () { }),

    /////
    MoreFunctionIconData("lib/images/mine_info/ic_user_history.png", "阅读记录", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_tag.png", "标签管理", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_suggest.png", "意见反馈", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_resume.png", "简历管理", () { }),
    MoreFunctionIconData("lib/images/mine_info/ic_user_suggest.png", "意见反馈", () { }),
  ];

  final int PAGE_ICON_COUNT = 8;

  List<MoreFunctionIconData> showList = [];

  List<Widget> gridList(List<MoreFunctionIconData> showList){
      List<Widget> retList = [];
      showList.forEach((element) {
        retList.add(iconTitleCell2(element.localIcon, element.title, element.onTap));
      });
      return retList;
  }

  Widget moreFunctionCell(){
    int page = allList.length % PAGE_ICON_COUNT == 0
        ? (allList.length ~/ PAGE_ICON_COUNT)
        : (allList.length ~/ PAGE_ICON_COUNT + 1);

    return Container(
      height: 180,
     child: Card(
       color: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(5))
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start ,
         children: [
           Container(
               margin: EdgeInsets.only(left: 10,top: 10,bottom: 16),
               child: Text(
               "更多功能",
             style: TextStyle(
                 fontSize: BFontSize.FONT_SIZE_SAMLL+1,
                 fontWeight: FontWeight.w500),
                 textAlign: TextAlign.left)),
            Container(
              height: 124,
              child: Swiper(
                autoplay: false,
                outer: false,
                loop: false,
                itemCount: page,
                pagination: new SwiperPagination(
                    margin: EdgeInsets.all(5),
                    builder: DotSwiperPaginationBuilder(
                        size: 4,
                        activeSize: 6,
                        space: 2,
                        activeColor: Colors.grey[400],
                        color: Colors.grey[300]
                    )
                ),//如果不填则不显示指示点
                itemBuilder: (BuildContext context,int pageIndex){
                  showList.clear();
                  for(var i =0;i<page;++i){
                    if(pageIndex == i){
                      showList = allList.getRange(i*PAGE_ICON_COUNT, min((i+1)*PAGE_ICON_COUNT,allList.length)).toList();
                    }
                  }
                  return GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      childAspectRatio: 10/7
                    ),
                    children: gridList(showList),
                  );
                },
              ),
            )

         ],
       ),
     ),
    );
  }

  Widget creatorCenterCard(){
    if(! widget.isLogin){
      return Container();
    }
    return
      Container(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Container(
            padding: EdgeInsets.only(bottom: 22),
            child:           Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 16),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "创作者中心",
                              style:TextStyle(
                                  fontSize: BFontSize.FONT_SIZE_SAMLL+1,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left)
                      ),
                      Flexible(fit : FlexFit.tight,child: SizedBox()),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios_outlined,size: 12,),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: creatorCenterSubCard("文章展现数", 0, 0),
                      ),
                      Container(
                        child: creatorCenterSubCard("文章阅读数", 0, 0),
                      ),
                      Container(
                        child: creatorCenterSubCard("文章点赞数", 0, 0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        )
      );
  }

  Widget creatorCenterSubCard(String title, int count, int changeCount){
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
                title,
                style: TextStyle(
                    color: BColors.COMMON_TEXT_GREY,
                    fontSize: BFontSize.FONT_SIZE_SAMLLEST
                ))),
          Container(
            margin: EdgeInsets.only(top: 4,bottom: 4),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: BFontSize.FONT_SIZE_BIG
              ),
            ),
          ),
          Container(
            child: Text(
              "较前日  " + changeCountString(0),
              style: TextStyle(
                color: BColors.COMMON_TEXT_GREY,
                fontSize: BFontSize.FONT_SIZE_SAMLLEST
              ),
            ),
          ),
        ],
      ),
    );
  }

  String changeCountString(int changeCount){
    if(changeCount>0){
      return "+"+changeCount.toString();
    }else if(changeCount<0){
      return "-"+changeCount.toString();
    }else{
      return "--";
    }
  }
}
