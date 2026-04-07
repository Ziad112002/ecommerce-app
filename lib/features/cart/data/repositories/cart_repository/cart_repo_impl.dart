import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:ecommerce_app/core/utils/extensions/connectivity_extension.dart';
import 'package:ecommerce_app/features/cart/data/mappers/cart_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/remote_cart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/api_result.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/repository/cart_repo.dart';
import 'data_source/remote_cart_data_source.dart';
@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo{
  final RemoteCartDataSource _remoteCartDataSource;
  final Connectivity _connectivity;
  CartRepoImpl(this._remoteCartDataSource,this._connectivity);
  @override
  Future<ApiResult<Cart>> addToCart(String productId)async {
    if (await _connectivity.isConnected) {
      var result = await _remoteCartDataSource.addToCart(productId);
      if (result.isSuccess&& result.getData!=null) {
        RemoteCart? remoteCart = result.getData;
        Cart cart = remoteCart!.toCart();
        return SuccessApiResult(cart);
      }else{
        return ErrorApiResult(result.getError);
      }

    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }


  @override
  Future<ApiResult<Cart>>updateCartProductQuantity(String productId,int count)async{
    if (await _connectivity.isConnected) {
      var result = await _remoteCartDataSource.updateCartProductQuantity(productId,count);
      if (result.isSuccess&& result.getData!=null) {
        RemoteCart? remoteCart = result.getData;
        Cart cart = remoteCart!.toCart();
        return SuccessApiResult(cart);
      }else{
        return ErrorApiResult(result.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }
  @override
  Future<ApiResult<Cart>> getCart()async{
    if (await _connectivity.isConnected) {
      var result = await _remoteCartDataSource.getCart();
      if (result.isSuccess&& result.getData!=null) {
        RemoteCart? remoteCart = result.getData;
          Cart cart = remoteCart!.toCart();
          return SuccessApiResult(cart);
        }else{
        return ErrorApiResult(result.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }
  @override
  Future<ApiResult<Cart>> deleteFromCart(String productId)async{
    if (await _connectivity.isConnected) {
      var result = await _remoteCartDataSource.deleteFromCart(productId);
      if (result.isSuccess&& result.getData!=null) {
        RemoteCart? remoteCart = result.getData;
        Cart cart = remoteCart!.toCart();
        return SuccessApiResult(cart);
      }else{
        return ErrorApiResult(result.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }
}