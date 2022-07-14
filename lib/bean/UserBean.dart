class UserBean{
  String userId;
  String userName;
  String headerUrl;
  int level;
  int followerCount ;
  int likeCount;
  int badgeCount;

  UserBean(this.userId, this.userName, this.headerUrl, this.level,
      this.followerCount, this.likeCount, this.badgeCount);

  static UserBean mockData(){
    return UserBean(
        "userId",
        "userName",
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202107%2F09%2F20210709142454_dc8dc.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1660395719&t=3cdb0f4ae37a133d24a5ef1e95d27e58",
        2,
        100,
        298,
        0);
  }
}