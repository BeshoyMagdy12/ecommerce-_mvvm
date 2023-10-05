
import 'package:flutter/material.dart';

import '../../../../core/utilities/cash_healper.dart';
import '../../data/repository/repoReg.dart';

class RegisterProvider with ChangeNotifier{
  TextEditingController textEditingControllerName=TextEditingController();
  TextEditingController textEditingControllerPhone=TextEditingController();
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPassword=TextEditingController();

  String? _message;
  bool? _status;
  String get message=>_message!;
  bool get status=>_status!;
  bool obscureText=true;
  void vsisbillPassword(){
    obscureText=!obscureText;
    notifyListeners();
  }

  final  RepoRegister repoRegister;
  RegisterProvider({required this.repoRegister});

  Future<void> register({required String name,required String phone ,required String email,required String password})async{

    try{
      var res=await  repoRegister.Register(name, phone, email, password);
      _message=res.message;
      _status=res.status;
      CasheHelper.setDataString(key: "token", value:res.token! );

    }catch(e){
      debugPrint("error in provider register in $e");

    }


}





}