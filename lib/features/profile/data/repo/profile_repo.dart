import '../models/profile_model.dart';

abstract class ProfileRepo{
  Future<void> changePassword({required String oldPassword,required String newPassword});
  Future<ProfileModel?> getDataProfile();


}