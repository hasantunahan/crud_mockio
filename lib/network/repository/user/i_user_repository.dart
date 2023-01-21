import 'package:crud_mockio/network/model/user/user.dart';

abstract class IUserRepository {
  Future<List<User>> getUsers();
}
