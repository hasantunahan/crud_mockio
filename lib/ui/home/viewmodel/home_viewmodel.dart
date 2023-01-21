import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/network/repository/user/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import "package:mobx/mobx.dart";

part "home_viewmodel.g.dart";

@Injectable(as: IHomeViewModel)
class HomeViewModel = IHomeViewModel with _$HomeViewModel;

abstract class IHomeViewModel with Store {
  final IUserRepository userRepository;
  IHomeViewModel(this.userRepository);

  @observable
  bool loading = false;
  @action
  void changeLoading(bool value) => loading = value;

  @observable
  List<User>? listOfUser;

  Future<void> fetchUser() async {
    changeLoading(true);
    final res = await userRepository.getUsers();
    changeLoading(false);
    listOfUser = res;
  }

  Future<void> init() async {
    await fetchUser();
  }
}
