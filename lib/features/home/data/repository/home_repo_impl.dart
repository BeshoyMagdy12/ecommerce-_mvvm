import 'package:ecco_app/core/utilities/AppApiService.dart';
import 'package:ecco_app/core/utilities/response.dart';
import 'package:ecco_app/features/home/data/model/banners.dart';
import 'package:ecco_app/features/home/data/model/ProductModel.dart';
import 'package:ecco_app/features/home/data/model/categores.dart';
import 'package:ecco_app/features/home/data/repository/home_repo.dart';
import 'package:flutter/material.dart';
import '../model/ProductModel.dart';


class HomeRepoImpl extends HomeRepo{
  @override
  Future<List<ProductModel>> getAllProduct()async {
    List<ProductModel> products=[];
    try{
      var res=await ApiService.get("home");
      if(res.statusCode==200){
        final data=res.data["data"]['products'] as List;
        products=data.map((prod) => ProductModel.fromJson(prod)).toList();
        print("home repo impl ${products.length}");

        return products;
      }else{
        print(res.statusCode);

      }

    }catch(e){

      debugPrint("problem in HomeRepoImpl $e ");
    }
    return products;
  }


  @override
  Future<List<BannersModel>?> getAllBanner()async {
    List<BannersModel> banner=[];
    try{
      var res=await  ApiService.get("banners");
      if(res.statusCode==200){
        final data=res.data["data"] as List;
        banner=data.map((e) => BannersModel.fromJson(data: e)).toList();
        return banner;
      }else{
        debugPrint("home Repo imp in method banners statusCode${res.statusCode}");
      }
    }catch(e){
      debugPrint("ome Repo imp in method banners $e");
    }
    }

  @override
  Future<List<CategoresModel>?> getAllCategores()async {
    List<CategoresModel> categores=[];
    try{
     var res=await ApiService.get("categories");
     if(res.statusCode==200){
       final data=res.data["data"] ["data"] as List;
       categores=data.map((e) => CategoresModel.fromJson(data: e)).toList();
       return categores;
     }else{
       debugPrint("home Repo imp in method categores statusCode${res.statusCode}");

     }

    }catch(e){
      debugPrint("ome Repo imp in method categores $e");

    }
    throw categores;
  }
}