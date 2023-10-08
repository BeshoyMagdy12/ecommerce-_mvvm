import 'package:ecco_app/core/utilities/AppRouter.dart';
import 'package:ecco_app/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/cash_healper.dart';
import '../../data/repo/profile_repo.dart';

class ProvProfile with ChangeNotifier{

  final ProfileRepo profileRepo;

  ProvProfile({required this.profileRepo});

  Future<void> changePass({required String oldPassword,required String newPassword})async{

    try{
  var res=  await   profileRepo.changePassword(oldPassword: oldPassword, newPassword: newPassword);

      notifyListeners();
   print("Password changed successfully");


    }catch(e){
      print("problem in ProvProfile $e");
    }

  }

  String? _name;
  String? _email;
  String? _img;

  Future<void> getProfile() async {
    try {
      var res = await profileRepo.getDataProfile();
      _name = res?.name;
      _email = res?.email;
      _img = res?.img;
      notifyListeners();
    } catch (e) {
      print("Error in getProfile: $e");
    }
  }

  String get name => _name ?? '';
  String get email => _email ?? '';
  String get img => _img ?? '';






}