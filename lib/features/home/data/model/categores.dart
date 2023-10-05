class CategoresModel {
  int? id;
  String? url;
  String? name;

  CategoresModel.fromJson({required Map<String, dynamic> data}) {
    id = data["id"];
    url = data["image"];
    name=data["name"];
  }
}
