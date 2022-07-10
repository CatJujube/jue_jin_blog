import '../BaseRequest.dart';

class GetVerifyCodeRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "LoginRegisterContorller/getVerifyCode";
  }

}