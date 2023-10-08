import 'package:dio/dio.dart';
import 'package:ecco_app/core/utilities/AppApiService.dart';
import 'package:ecco_app/core/utilities/cash_healper.dart';
import 'package:ecco_app/features/profile/data/models/profile_model.dart';
import 'package:ecco_app/features/profile/data/repo/profile_repo.dart';


class ProfileRepoImpl extends ProfileRepo {




  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
    var res=  await ApiService.post(
        "change-password",
        {
          "current_password": oldPassword,
          "new_password": newPassword,
        },
      );
    if(res.data["status"]==true){
      print("Password changed successfully");

    }else{
      print("Failed to change password: ${res.data["message"]} ");

    }
    } catch (e) {
      print("Failed to change password: $e");
    }
  }

  @override
  Future<ProfileModel?> getDataProfile()async {

    try{
      var res=await ApiService.get("profile",Options(
        headers: {
          'Authorization': CasheHelper.getDataString(key: "token"),
          // Other headers if needed
        },
      ),);
      if(res.data["status"]==true&&res.statusCode==200){
        return ProfileModel(name: res.data ["data"]["name"]   , email: res.data["data"]["email"], img: res.data["data"]["image"]);

      }else{
        print("profile repo impl problem  ${res.data["message"]}");
      }

    }catch(e){
      print(e);
    }
  }
}

