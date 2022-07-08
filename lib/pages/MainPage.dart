import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/MineInfoBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HomePageBean.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';
import 'package:jue_jin_blog/pages/HomePage.dart';
import 'package:jue_jin_blog/pages/MineInfoPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [HomePage(HomePageBean.mockData()), EmptyPage("沸点"), EmptyPage("发现"), EmptyPage("课程"),MineInfoPage(MineInfoBean.mockData())];
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
        selectedItemColor: Colors.blueAccent,
        iconSize: iconSize,
      ),
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  static final double iconSize= 20;

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_home_normal.webp"),size: iconSize,) ,
      activeIcon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_home.webp"),size: iconSize,) ,
      label: "首页",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_activity.webp"),size: iconSize,) ,
      activeIcon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_activity_press.webp"),size: iconSize,) ,
      label: "热点",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_find_normal.webp"),size: iconSize,) ,
      activeIcon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_find.webp"),size: iconSize,),
      label: "发现",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_xiaoce_normal.webp"),size: iconSize,),
      activeIcon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_xiaoce.webp"),size: iconSize,),

      label: "课程",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_profile_normal.webp"),size: iconSize,),
      activeIcon: ImageIcon(AssetImage("lib/images/bottom_bar/tab_profile.webp"),size: iconSize,),
      label: "我",
    ),
  ];
}
