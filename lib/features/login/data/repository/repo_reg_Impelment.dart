

import 'package:ecco_app/core/utilities/response.dart';
import 'package:ecco_app/features/login/data/repository/repo_login.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utilities/AppApiService.dart';

class RepoLoginImpelment extends RepoLogin{
  @override
  Future<Response> LogIn(String email, String password)async {

    try{
      var res=await ApiService.post("login", {
        "email":email,
        "password":password,

      },);

      if(res.statusCode==200){
        return Response(status: res.data["status"], message: res.data["message"], token: res.data["data"]["token"]);

      }else{
        print("login  in problem statusCode=${res.statusCode}");

      }
    }catch(e){
      debugPrint("error in repo_login implement $e");
    }

    return Response(status: false, message: "problem login implement repo", token: "null");

  }

}