import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart.dart';
import 'package:injectable/injectable.dart';

import '../repository/cart_repo.dart';
@injectable
class DeleteFromCartUseCase {
  final CartRepo _cartRepo;
  DeleteFromCartUseCase(this._cartRepo);
  Future<ApiResult<Cart>>call(String productId)async {
    return await _cartRepo.deleteFromCart(productId);
  }
}