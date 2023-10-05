import '../../../../core/utilities/response.dart';

abstract class RepoLogin {

  Future<Response> LogIn(String email,String password);

}