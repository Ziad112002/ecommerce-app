import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart.dart';
import 'package:injectable/injectable.dart';

import '../repository/cart_repo.dart';
@injectable
class GetCartUseCase {
  final CartRepo _cartRepo;
  GetCartUseCase(this._cartRepo);
  Future<ApiResult<Cart>>call()async {
    return await _cartRepo.getCart();
  }
}