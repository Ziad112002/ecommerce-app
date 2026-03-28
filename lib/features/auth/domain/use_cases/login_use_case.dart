import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);
  Future<ApiResult<void>>call(LoginRequest request)async{
  return await _authRepo.login(request);
}
}