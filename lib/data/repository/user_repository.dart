import 'package:dartz/dartz.dart';
import 'package:grappus_mobile/data/models/user/user_model.dart';
import 'package:grappus_mobile/data/network/api/error/error_response.dart';
import 'package:grappus_mobile/data/network/api/user/user_api.dart';

class UserRepository {
  UserRepository(this.userApi);

  final UserApi userApi;

  Future<Either<ErrorResponse, List<UserModel>>> getUsersRequested() async {
    final data = await userApi.getUsersApi();
    return data;
  }
}
