import 'package:jue_jin_blog/bean/BlogCardBean.dart';
import 'package:jue_jin_blog/bean/home_page_bean/BaseTabBean.dart';

class RecommendTabBean extends BaseTabBean{
  bool isLogin = false;
  List<BlogCardBean> hotBlogList = [];
  List<BlogCardBean> blogCardList = [];

  RecommendTabBean(this.isLogin, this.hotBlogList, this.blogCardList){
    this.tabType = TabBeanType.RECOMMEND_TYPE;
  }

  static final cardBean = BlogCardBean("你还在直接用localStorage么？该提升下逼格了！", "Gaby", 0,
      "在登录或者注册页面，需要在底部展示一些隐私政策或者是隐私协议，就是用了一种Stack布局方式，但是使用这种方式在没有键盘弹出的时候看起来一起正常，但是只要有软键盘弹出就会把底部使用Positioned包裹的Widget给顶起来。",
      1801, 259, ["前端"]);
  static final cardBean2 = BlogCardBean("需要在底部展示一些", "Gaby", 0,
      "在登录或者注册页面，需要在底部展示一些隐私政策或者是隐私协议，就是用了一种Stack布局方式，但是使用这种方式在没有键盘弹出的时候看起来一起正常，但是只要有软键盘弹出就会把底部使用Positioned包裹的Widget给顶起来。",
      1801, 259, ["前端"]);

  static BaseTabBean mockData(){
    List<BlogCardBean> hotBlogList = [
      cardBean,
      cardBean,
      cardBean,
    ];
    List<BlogCardBean> blogCardList = [];
    for(var i=0 ;i<50;++i){
      blogCardList.add(cardBean);
      var bean = cardBean2;
      bean.coverUrl = "";
      blogCardList.add(bean);
    }
    return RecommendTabBean(false, hotBlogList, blogCardList);
  }
}