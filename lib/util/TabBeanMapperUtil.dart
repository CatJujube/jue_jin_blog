import 'package:flutter/cupertino.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/FollowTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BubbleTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/RecommendTabBean.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';
import 'package:jue_jin_blog/pages/home_pages/BubbleTabPage.dart';
import 'package:jue_jin_blog/pages/home_pages/FollowPage.dart';
import 'package:jue_jin_blog/pages/home_pages/HeadLinePage.dart';
import 'package:jue_jin_blog/pages/home_pages/HotPage.dart';
import 'package:jue_jin_blog/pages/home_pages/RecommendPage.dart';

class TabBeanMapperUtil{
  static Widget tabBeanPageMapper(BaseTabBean tabBean, bool isLogin){
    int type = tabBean.tabType;
    switch(type){
      case BaseCategoryType.RECOMMEND_TYPE:
        RecommendTabBean bean = tabBean as RecommendTabBean;
        return RecommendPage(bean,isLogin);
      case BaseCategoryType.FOLLOW_TYPE:
        FollowTabBean bean = tabBean as FollowTabBean;
        return FollowPage(bean,true);
      case BaseCategoryType.HOT_TYPE:
        HotTabBean bean = tabBean as HotTabBean;
        return HotPage(bean,isLogin);
      case BaseCategoryType.HEADLINE_TYPE:
        BubbleTabBean bean = tabBean as BubbleTabBean;
        return HeadLinePage(bean,isLogin);
      case BaseCategoryType.BACK_END_TYPE:
      case BaseCategoryType.FOREGROUND_TYPE:
      case BaseCategoryType.IOS_TYPE:
      case BaseCategoryType.ANDROID_TYPE:
      case BaseCategoryType.AI_TYPE:
      case BaseCategoryType.STORE_TYPE:
        BubbleTabBean bean = tabBean as BubbleTabBean;
        return BubbleTabPage(bean,isLogin);
      default:
        return EmptyPage("");
    }
  }
}