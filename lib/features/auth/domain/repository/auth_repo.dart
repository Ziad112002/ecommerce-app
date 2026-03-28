import '../../../../core/utils/api_result.dart';
import '../../../network/models/request/login_request.dart';
import '../../../network/models/request/register_request.dart';

abstract class AuthRepo {
  Future<ApiResult<void>>login(LoginRequest request);
  Future<ApiResult<void>>register(RegisterRequest request);
}