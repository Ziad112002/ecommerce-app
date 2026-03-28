import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:ecommerce_app/features/network/models/response/auth_response.dart';

import '../../../../network/models/request/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponse>>login(LoginRequest request);
  Future<ApiResult<AuthResponse>>register(RegisterRequest request);
}