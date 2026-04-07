import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart.dart';
import 'package:injectable/injectable.dart';

import '../repository/cart_repo.dart';
@injectable
class UpdateCartProductQuantityUseCase {
  final CartRepo _cartRepo;
  UpdateCartProductQuantityUseCase(this._cartRepo);
  Future<ApiResult<Cart>>call(String productId,int count)async {
    return await _cartRepo.updateCartProductQuantity(productId,count);
  }
}