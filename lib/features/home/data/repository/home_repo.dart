
import 'package:ecco_app/features/home/data/model/banners.dart';
import 'package:ecco_app/features/home/data/model/categores.dart';

import '../model/ProductModel.dart';
abstract class HomeRepo{
  Future <List<ProductModel>> getAllProduct();
  Future<List<BannersModel>?> getAllBanner();
  Future<List<CategoresModel>?> getAllCategores();


}