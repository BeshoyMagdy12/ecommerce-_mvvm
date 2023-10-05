import 'package:ecco_app/features/register/data/repository/repoReg.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/AppApiService.dart';
import '../../../../core/utilities/response.dart';

class RepoRegImpelment extends RepoRegister{
  @override
  Future<Response> Register(String userName, String phone, String email, String password)async {

    try{
      var res=await ApiService.post("register", {
        "name":userName,
        "phone":phone,
        "email":email,
        "password":password,

      },);

      if(res.statusCode==200){
        return Response(status: res.data["status"], message: res.data["message"], token: res.data["data"]["token"]);

      }else{
        print("register in problem statusCode=${res.statusCode}");
      }
    }catch(e){
      debugPrint("error in repo_register implement $e");

    }
return Response(status: false, message: "problem register implement repo", token: "null");
  }

  

}