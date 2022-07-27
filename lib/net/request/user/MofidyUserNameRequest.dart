import 'package:jue_jin_blog/net/request/BaseRequest.dart';

class MofidyUserNameRequest_Param{
  String? userId;
  String? newUserName;
  String? token;
}

class MofidyUserNameRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  String path() {
    return "userController/mofidyUserNameById";
  }

  static MofidyUserNameRequest getRequest(MofidyUserNameRequest_Param param){
    MofidyUserNameRequest request = MofidyUserNameRequest();
    request.add("id", param.userId ?? "");
    request.add("token",param.token ?? "");
    request.add("userName", param.newUserName ?? "");
    return request;
  }
}