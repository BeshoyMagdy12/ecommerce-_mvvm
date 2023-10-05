class BannersModel {
  int? id;
  String? img;



  BannersModel.fromJson({required Map<String, dynamic> data}) {
    id = data["id"];
    img = data["image"];
  }
}
