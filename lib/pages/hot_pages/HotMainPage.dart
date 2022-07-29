import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/pages/hot_pages/DevelopPage.dart';
import 'package:jue_jin_blog/pages/hot_pages/FocusPage.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';

import '../../res/color/BColors.dart';

class HotMainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar Demo',
      theme: ThemeData(
          primaryColor: BColors.COMMON_WITE_BG_COLOR
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(//顶部TabBar
            length: 2,//顶部TabBar数量
            initialIndex: 1,//默认选择第一项
        child: Scaffold(//这里配置bottom属性来写TabBar
        appBar: new AppBar(
          backgroundColor: Colors.white,//顶部内容
        title: Row(//title 里面放TabBar组件
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          TabBar(//这里面写TabBar
            isScrollable: true,//允许滚动
            indicatorColor: Colors.blueAccent,//指示器颜色
            indicatorWeight: 3,//指示器高度x
            indicatorSize: TabBarIndicatorSize.label,//指示器大小,底部边框
            labelColor: Colors.blueAccent,//选中label颜色
            unselectedLabelColor: Colors.black87,//未选中label颜色
            tabs: [
              Container(
                child: Tab(child: Text("发现",style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),),),
              ),
              Container(
                child: Tab(child: Text("关注",style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),),),
              ),
            ],
        ),
    ]
    ),
    ),
    body: new TabBarView( //关联上面的bottomTabBar 这里可以配置多个组件,
    children: [
      DevelopPage(),
      FocusPage(),
    ],
    ),
    )
    ),
    ),
    );
  }
}
