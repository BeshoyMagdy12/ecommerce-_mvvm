import 'package:ecco_app/core/utilities/response.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utilities/cash_healper.dart';
import '../../data/repository/repo_login.dart';

 class ProvLogin with ChangeNotifier{
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPassword=TextEditingController();

  String? _message;
  bool? _status;
  String? _token;
 String get message=>_message!;
  String get token=>_token!;

  bool get status=>_status!;

  bool obscureText=true;
  void vsisbillPassword(){
    obscureText=!obscureText;
    notifyListeners();
  }

  final RepoLogin repoLogin;

  ProvLogin({required this.repoLogin});

  Future<void> login({required String email,required String paswword}) async {
    try{
      var req=    await repoLogin.LogIn(email, paswword);
      _message=req.message;
      _status=req.status;
      _token=req.token;
      CasheHelper.setDataString(key: "token", value:_token! );
      debugPrint(CasheHelper.getDataString(key: "token"));
      notifyListeners();


    }catch(e){
      debugPrint("error in provider login in $e");

    }



  }

}