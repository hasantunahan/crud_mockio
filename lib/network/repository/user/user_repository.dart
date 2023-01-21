import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/network/repository/user/i_user_repository.dart';
import 'package:crud_mockio/network/service/user/user_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  UserService get userService => UserService();

  @override
  Future<List<User>> getUsers() async {
    try {
      final res = await userService.getUsers();
      return res;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<User> deleteUser(String id) async {
    try {
      final res = await userService.deleteUser(id);
      return res;
    } catch (e) {
      return User();
    }
  }

  @override
  Future<User> getUserById(String id) async {
    try {
      final res = await userService.getUserById(id);
      return res;
    } catch (e) {
      return User();
    }
  }

  @override
  Future<User> addNewChef(User user) async {
    try {
      final res = await userService.addNewUser(user);
      return res;
    } catch (e) {
      return User();
    }
  }
}
