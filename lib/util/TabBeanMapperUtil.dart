import 'package:flutter/cupertino.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/FollowTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/HotTabBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/RecommendTabBean.dart';
import 'package:jue_jin_blog/pages/EmptyPage.dart';
import 'package:jue_jin_blog/pages/home_pages/FollowPage.dart';
import 'package:jue_jin_blog/pages/home_pages/HotPage.dart';
import 'package:jue_jin_blog/pages/home_pages/RecommendPage.dart';

class TabBeanMapperUtil{
  static Widget tabBeanPageMapper(BaseTabBean tabBean, bool isLogin){
    int type = tabBean.tabType;
    switch(type){
      case TabBeanType.RECOMMEND_TYPE:
        RecommendTabBean bean = tabBean as RecommendTabBean;
        return RecommendPage(bean,isLogin);
      case TabBeanType.FOLLOW_TYPE:
        FollowTabBean bean = tabBean as FollowTabBean;
        return FollowPage(bean,isLogin);
      case TabBeanType.HOT_TYPE:
        HotTabBean bean = tabBean as HotTabBean;
        return HotPage(bean,isLogin);
      default:
        return EmptyPage("");
    }
  }
}