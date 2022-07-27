import 'package:jue_jin_blog/net/request/BaseRequest.dart';

class LoginRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "LoginRegisterContorller/login";
  }

}