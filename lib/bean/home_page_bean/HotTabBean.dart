import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';

class HotTabBean extends BaseTabBean{
  List<String> bubbleTitles=[];

  static mockData(){
    HotTabBean bean = HotTabBean();
    bean.tabType = TabBeanType.HOT_TYPE;
    bean.bubbleTitles = ["前端","后端","ios","Android","人工智能"];
    return bean;
  }
}