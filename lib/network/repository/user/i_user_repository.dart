import 'package:crud_mockio/network/model/user/user.dart';

abstract class IUserRepository {
  Future<List<User>> getUsers();
  Future<User> getUserById(String id);
  Future<User> deleteUser(String id);
  Future<User> addNewChef(User user);
}
