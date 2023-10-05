
import '../../../../core/utilities/response.dart';
abstract class RepoRegister {

  Future<Response> Register(String userName,String phone,String email,String password);

}