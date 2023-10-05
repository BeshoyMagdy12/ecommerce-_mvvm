import 'package:ecco_app/core/utilities/AppApiService.dart';
import 'package:ecco_app/features/home/data/model/ProductModel.dart';

import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo{
  @override
  Future<ProductModel> getAllFavorites()async {
    ApiService.get("favorites");
    throw UnimplementedError();
  }
}