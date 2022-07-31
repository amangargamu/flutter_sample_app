import 'package:bigspoon_foods/data/models/user/user_model.dart';
import 'package:bigspoon_foods/data/network/api/endpoints.dart';
import 'package:bigspoon_foods/data/network/api/error/error_handler.dart';
import 'package:bigspoon_foods/data/network/api/error/error_response.dart';
import 'package:bigspoon_foods/data/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserApi {
  UserApi({required this.dioClient});

  final DioClient dioClient;

  Future<Either<ErrorResponse, List<UserModel>>> getUsersApi() async {
    try {
      final response = await dioClient.get(Endpoints.users);
      return Right(
        (response.data['data'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList(),
      );
    } on DioError catch (e) {
      return left(handleError(e));
    }
  }
}
