import 'dart:async';

import 'package:ecco_app/features/home/data/model/ProductModel.dart';
import 'package:ecco_app/features/home/data/model/banners.dart';
import 'package:flutter/material.dart';

import '../../data/model/categores.dart';
import '../../data/repository/home_repo.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepo homeRepo;

  HomeProvider({required this.homeRepo});

//----------------get all product--------------------------
  List<ProductModel> _products = [];

  List<ProductModel>? get products => _products;

  Future<void> getProducts() async {
    await homeRepo.getAllProduct().then((p) {
      _products = p;

      print(products!.length);
      notifyListeners();
    }).catchError((e) {
      debugPrint("problem in HomeProvider $e");
    });
  }

//----------------------get all banners-------------------------------------------

  List<BannersModel> _banners = [];
  Future<void> getBanners() async {
   await homeRepo.getAllBanner().then((value) {
      _banners = value!;
      notifyListeners();
    }).catchError((e) {
      debugPrint("problem in HomeProvider $e");
    });
  }
  List<BannersModel>? get banners => _banners;

//---------------------------------------------------------------------------


//----------------------------getAllCategores----------------------------------
List<CategoresModel> _categores=[];
Future<void> getCategores()async{
 await homeRepo.getAllCategores().then((value){
    _categores=value!;

    notifyListeners();
  }).catchError((e){
    debugPrint("problem in HomeProvider $e");

  });
}
  List<CategoresModel>? get cat => _categores;
//------------------------------------------------------------------------------

  List<ProductModel> _filterProduct=[];

void filiterProduct({required String input})async{

  _filterProduct= await _products.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    notifyListeners();
}
  List<ProductModel>? get filterProduct=>_filterProduct;


}
