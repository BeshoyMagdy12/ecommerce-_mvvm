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


  Future<void> getProducts() async {
    try {
      final products = await homeRepo.getAllProduct();

      _products = products;

      print(products!.length);
      notifyListeners();
    } catch (e) {
      debugPrint("Problem in HomeProvider: $e");
    }
  }
  List<ProductModel>? get products => _products;


//----------------------get all banners-------------------------------------------

  List<BannersModel> _banners = [];

  Future<void> getBanners() async {
    try {
      final value = await homeRepo.getAllBanner();

      if (value != null) {
        _banners = value;
        notifyListeners();
      } else {
        debugPrint("getAllBanner returned null");
      }
    } catch (e) {
      debugPrint("Problem in HomeProvider: $e");
    }
  }

  List<BannersModel>? get banners => _banners;


//---------------------------------------------------------------------------


//----------------------------getAllCategores----------------------------------
  List<CategoresModel> _categores = [];

  Future<void> getCategores() async {
    try {
      final value = await homeRepo.getAllCategores();

      if (value != null) {
        _categores = value;
        notifyListeners();
      } else {
        debugPrint("getAllCategores returned null");
      }
    } catch (e) {
      debugPrint("Problem in HomeProvider: $e");
    }
  }

  List<CategoresModel>? get cat => _categores;

//------------------------------------------------------------------------------

  List<ProductModel> _filterProduct = [];


  void filterProduct({required String input}) {
    _filterProduct = _products
        .where((element) =>
    element.name != null &&
        element.name!.toUpperCase().startsWith(input.toUpperCase()))
        .toList();
    print(_filterProduct.length);
    notifyListeners();
  }
  List<ProductModel> get filterProducts => _filterProduct;


}
