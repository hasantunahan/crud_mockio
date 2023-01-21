import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/network/api/i_api.dart';
import 'package:crud_mockio/network/constant/api_path.dart';
import 'package:crud_mockio/network/model/user/user.dart';
import 'package:dio/dio.dart';
import "package:retrofit/retrofit.dart";

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService() => _UserService(getIt<IApi>().createDio());

  @GET(ApiPath.users)
  Future<List<User>> getUsers();

  @DELETE("${ApiPath.users}/{id}")
  Future<User> deleteUser(@Path("id") String id);

  @POST(ApiPath.users)
  Future<User> addNewUser(@Body() User user);
}
