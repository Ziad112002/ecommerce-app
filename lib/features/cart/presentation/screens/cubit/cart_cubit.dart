import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/delete_from_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/update_cart%20_product_quantity_use_case.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartProductQuantityUseCase _cartProductQuantityUseCase;
  final GetCartUseCase _getCartUseCase;
  final DeleteFromCartUseCase _deleteFromCartUseCase;

  CartCubit(this._addToCartUseCase, this._cartProductQuantityUseCase,
      this._getCartUseCase, this._deleteFromCartUseCase)
      : super(CartState(cartApi: Resource.initial()));
bool isProductInCart(String productId) {
  if(state.cart?.cartProducts[productId]==null)return false;
 return state.cart!.cartProducts[productId] != null;
}
  Future<void> addToCart(String productId) async {
    emit(state.copyWith(cartApi: Resource.loading()));
    var result = await _addToCartUseCase(productId);
    if (result.isSuccess) {
      emit(state.copyWith(
          cart: result.getData, cartApi: Resource.success(result.getData)));
    } else {
      emit(state.copyWith(
          cartApi: Resource.error(result.getError.errorMessage)));
    }
  }

  Future<void> updateCartProductQuantity(String productId, int count) async {
    emit(state.copyWith(cartApi: Resource.loading()));
    var result = await _cartProductQuantityUseCase(productId, count);
    if (result.isSuccess) {
      emit(state.copyWith(
          cart: result.getData, cartApi: Resource.success(result.getData)));
    } else {
      emit(state.copyWith(
          cartApi: Resource.error(result.getError.errorMessage)));
    }
  }

  Future<void> getCart() async {
    emit(state.copyWith(cartApi: Resource.loading()));
    var result = await _getCartUseCase();
    if (result.isSuccess) {
      emit(state.copyWith(
          cart: result.getData, cartApi: Resource.success(result.getData)));
    } else {
      emit(state.copyWith(
          cartApi: Resource.error(result.getError.errorMessage)));
    }
  }

  Future<void> deleteFromCart(String productId) async {
    emit(state.copyWith(cartApi: Resource.loading()));
    var result = await _deleteFromCartUseCase(productId);
    if (result.isSuccess) {
      emit(state.copyWith(
          cart: result.getData, cartApi: Resource.success(result.getData)));
    } else {
      emit(state.copyWith(
          cartApi: Resource.error(result.getError.errorMessage)));
    }
  }
}
