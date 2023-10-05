import '../../../home/data/model/ProductModel.dart';

abstract class FavoriteRepo{
  Future<ProductModel> getAllFavorites();
}