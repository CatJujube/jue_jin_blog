
class MineInfoPageType{
  static const int UN_LOGIN_TYPE = 0;
  static const int LOGIN_TYPE = 1;
}

class MineInfoBean{
  int pageType = MineInfoPageType.UN_LOGIN_TYPE;
  String avatorUrl = "";
  int likeCount = 0;    //点赞
  int collectCount = 0; //收藏
  int followCount = 0;  //关注
  bool isLogin = false;

 static MineInfoBean mockData(){
   return MineInfoBean();
 }
}