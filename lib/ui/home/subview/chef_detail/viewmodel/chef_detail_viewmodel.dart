import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/network/repository/user/i_user_repository.dart';
import 'package:crud_mockio/product/config/navigation/navigation_service.dart';
import 'package:injectable/injectable.dart';
import "package:mobx/mobx.dart";

part "chef_detail_viewmodel.g.dart";

@Injectable(as: IChefDetailViewModel)
class ChefDetailViewModel = IChefDetailViewModel with _$ChefDetailViewModel;

abstract class IChefDetailViewModel with Store {
  final IUserRepository userRepository;
  IChefDetailViewModel(this.userRepository);

  @observable
  bool loading = false;
  @action
  void changeLoading(bool value) => loading = value;

  @observable
  User? user;

  Future<void> fetchUser(String id) async {
    changeLoading(true);
    final res = await userRepository.getUserById(id);
    changeLoading(false);
    user = res;
  }

  Future<void> deleteUser(String id) async {
    changeLoading(true);
    await userRepository.deleteUser(id);
    changeLoading(false);
    NavigationService.instance.router.pop();
  }

  Future<void> init(String userid) async {
    await fetchUser(userid);
  }
}
