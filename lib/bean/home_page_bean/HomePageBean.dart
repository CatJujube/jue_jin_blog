import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/FollowTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BubbleTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/RecommendTabBean.dart';

class HomePageBean{
    bool isLogin = false;
    List<BaseTabBean> tabList = [];

    HomePageBean(this.isLogin,this.tabList);

    static HomePageBean mockData(){
      return HomePageBean(false,[
          FollowTabBean.mockData(),
          RecommendTabBean.mockData(),
          HotTabBean.mockData(),
          BubbleTabBean.mockData(BaseCategoryType.HEADLINE_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.BACK_END_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.FOREGROUND_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.IOS_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.ANDROID_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.AI_TYPE),
          BubbleTabBean.mockData(BaseCategoryType.STORE_TYPE),
      ]);
    }
}