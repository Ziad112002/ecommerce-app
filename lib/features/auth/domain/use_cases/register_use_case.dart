import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_app/features/network/models/request/register_request.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);
  Future<ApiResult<void>>call(RegisterRequest request)async{
    return await _authRepo.register(request);
  }
}