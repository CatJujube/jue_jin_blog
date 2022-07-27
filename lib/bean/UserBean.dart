class UserBean {
  String? userId;
  String? userName;
  String? headerUrl;
  int? level;
  int? followerCount;
  int? likeCount;
  int? badgeCount;
  String? sex;
  String? phoneNumber;
  int? createTime;
  int? modifyTime;
  String? password;
  String? utoken;

  UserBean(
      {this.userId,
        this.userName,
        this.headerUrl,
        this.level,
        this.followerCount,
        this.likeCount,
        this.badgeCount,
        this.sex,
        this.phoneNumber,
        this.createTime,
        this.modifyTime,
        this.password,
        this.utoken});

  UserBean.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    headerUrl = json['headerUrl'];
    level = json['level'];
    followerCount = json['followerCount'];
    likeCount = json['likeCount'];
    badgeCount = json['badgeCount'];
    sex = json['sex'];
    phoneNumber = json['phoneNumber'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    password = json['password'];
    utoken = json['utoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['headerUrl'] = this.headerUrl;
    data['level'] = this.level;
    data['followerCount'] = this.followerCount;
    data['likeCount'] = this.likeCount;
    data['badgeCount'] = this.badgeCount;
    data['sex'] = this.sex;
    data['phoneNumber'] = this.phoneNumber;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['password'] = this.password;
    data['utoken'] = this.utoken;
    return data;
  }

  static mockData(){
    return UserBean();
  }
}