import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/network/repository/user/i_user_repository.dart';
import 'package:crud_mockio/product/config/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import "package:mobx/mobx.dart";

part "add_new_chef_viewmodel.g.dart";

@Injectable(as: IAddNewChefViewModel)
class AddNewChefViewModel = IAddNewChefViewModel with _$AddNewChefViewModel;

abstract class IAddNewChefViewModel with Store {
  IUserRepository userRepository;
  IAddNewChefViewModel(this.userRepository);

  final addFormKey = GlobalKey<FormState>();

  @observable
  bool loading = false;
  @action
  void changeLoading(bool value) => loading = value;

  @observable
  DateTime? selectedDate;

  @observable
  User user = User();

  @action
  void changeUserFromForm(User value) {
    user = value;
  }

  @action
  void changeSelectedDate({DateTime? value}) {
    selectedDate = value;
    user = user.copyWith(
      birthDate: value.toString(),
    );
  }

  @action
  Future<void> addNewChef() async {
    changeLoading(true);
    await userRepository.addNewChef(user);
    changeLoading(false);
    Future.delayed(const Duration(milliseconds: 500), () {
      NavigationService.instance.router.pop();
    });
  }
}
