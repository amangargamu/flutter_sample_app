import 'package:bigspoon_foods/data/models/user/user_model.dart';
import 'package:bigspoon_foods/data/network/api/error/error_response.dart';
import 'package:bigspoon_foods/data/network/api/user/user_api.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  UserRepository(this.userApi);

  final UserApi userApi;

  Future<Either<ErrorResponse, List<UserModel>>> getUsersRequested() async {
    final data = await userApi.getUsersApi();
    return data;
  }
}
