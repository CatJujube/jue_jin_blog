import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/FollowTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HomePageBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/RecommendTabBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';
import 'package:jue_jin_blog/pages/home_pages/FollowPage.dart';
import 'package:jue_jin_blog/pages/home_pages/RecommendPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/util/SystemUtil.dart';
import 'package:jue_jin_blog/util/TabBeanMapperUtil.dart';
import 'package:jue_jin_blog/widget/RightButtonTabBar.dart';
import 'package:jue_jin_blog/widget/SearchAppBar.dart';

class HomePage extends StatefulWidget {
  HomePage(this._bean,{Key? key}) : super(key: key){
    this.isLogin = _bean.isLogin;
  }

  HomePageBean _bean = HomePageBean.mockData();

  bool isLogin  = false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  List<BaseTabBean> _tabBeanList = [];
  double commonSpan = BSize.COMMON_LEFT_SPAN;

  @override
  void initState() {
    super.initState();
    _tabBeanList = widget._bean.tabList;
    _tabController = TabController(length: _tabBeanList.length, vsync: this);
  }

  double iconSize = 24;
  @override
  Widget build(BuildContext context) {
    SystemUtil.setStatusBarColor(BColors.COMMON_WITE_BG_COLOR);
    return Scaffold(
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
      appBar: SAppBarSearch(
          leading: Container(
            margin: EdgeInsets.only(left: commonSpan,right: commonSpan),
            child: InkWell(child:ImageIcon(
              AssetImage("lib/images/home_page/ic_live.png"),
              size: iconSize,
            ), onTap: (){
              NavUtils.navToEmptyPage(context, "直播");
            },
          )

        ),
        bottom: RightButtonTabBar(
          controller:_tabController,
          tabs: _tabBeanList.map((tabBean){
            return Container(
              child: RightButtonTab(text: TabBeanType.mapper(tabBean.tabType)),
            );
          }).toList(),
          indicatorColor: Colors.blueAccent,
          isScrollable: true,
          indicatorPadding: EdgeInsets.only(left: commonSpan,top: 0,right: commonSpan,bottom: 0),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[500],
          indicatorWeight: 3,
          labelPadding: EdgeInsets.only(top: 0, left:commonSpan,right:commonSpan,bottom: 0),
          rightIcon: IconButton(icon: Icon(Icons.menu,color: Colors.grey,),onPressed: (){
            NavUtils.navToEmptyPage(context, "");
          }),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 0,right: 15),
            child: InkWell(
                child: Image.asset("lib/images/home_page/ic_good_author.webp",width: iconSize,height: iconSize,),
                onTap: (){
                  NavUtils.navToEmptyPage(context, "勋章");
                }
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0,right: 15),
            child: InkWell(
                child: Image.asset("lib/images/home_page/ic_calendar_unchecked.webp",width: iconSize,height: iconSize,),
                onTap: (){
                  NavUtils.navToEmptyPage(context, "签到");
                }
            ),
          ),
        ],
      ),
      body: RightButtonTabBarView( //构建
        controller: _tabController,
        children: _tabBeanList.map((tabBean) {
          return Container(
            alignment: Alignment.center,
            child: TabBeanMapperUtil.tabBeanPageMapper(tabBean,widget._bean.isLogin),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


}
