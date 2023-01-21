import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/product/constant/assets.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/ui/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserItem extends StatelessWidget {
  final User user;
  final IHomeViewModel viewModel;
  const UserItem({
    required this.user,
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  Widget _renderText(BuildContext context, String? value) {
    return Text(
      value ?? context.translate.unknown,
      style: context.theme.textTheme.subtitle2,
    );
  }

  Widget _renderIcon(BuildContext context, IconData icon) {
    return Icon(
      icon,
      color: context.theme.colorScheme.secondary,
      size: 18,
    );
  }

  Widget _renderRowItem(BuildContext context, IconData icon, String? value) {
    return Row(
      children: [
        _renderIcon(context, icon),
        const SizedBox(width: 8),
        _renderText(context, value),
      ],
    );
  }

  Widget _renderDeleteUser(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: context.translate.delete_chef,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                context.translate.delete_chef_confirm,
                style: context.theme.textTheme.bodyText1,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(context.translate.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    viewModel.deleteUser(user.id!);
                  },
                  child: Text(context.translate.ok),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete_forever_sharp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        viewModel.goChefDetail(user.id!);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: context.theme.colorScheme.secondary,
              width: 1.6,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.instance.png.splashView,
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _renderText(context, user.name),
                        const SizedBox(width: 8),
                        _renderText(context, user.surname),
                      ],
                    ),
                    if (user.birthDate != null) ...[
                      _renderRowItem(
                          context, Icons.date_range, DateFormat('yyyy-MM-dd').format(DateTime.parse(user.birthDate!)))
                    ]
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            _renderRowItem(context, Icons.phone_android, user.phoneNumber),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderRowItem(context, Icons.monetization_on_outlined, user.sallary.toString()),
                _renderDeleteUser(context)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
