import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';

class FollowTabBean extends BaseTabBean{


  static BaseTabBean mockData(){
    BaseTabBean tabBean = FollowTabBean();
    tabBean.tabType = BaseCategoryType.FOLLOW_TYPE;
    return tabBean;
  }
}