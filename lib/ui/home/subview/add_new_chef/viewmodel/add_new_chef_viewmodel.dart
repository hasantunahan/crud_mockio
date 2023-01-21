import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import "package:mobx/mobx.dart";

part "add_new_chef_viewmodel.g.dart";

@Injectable(as: IAddNewChefViewModel)
class AddNewChefViewModel = IAddNewChefViewModel with _$AddNewChefViewModel;

abstract class IAddNewChefViewModel with Store {
  final addFormKey = GlobalKey<FormState>();

  @observable
  DateTime? selectedDate;

  @action
  void changeSelectedDate({DateTime? value}) {
    selectedDate = value;
  }

  Future<void> init() async {}
}
