import 'package:crud_mockio/network/model/user/user.dart';
import 'package:crud_mockio/product/constant/assets.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({
    required this.user,
    Key? key,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.colorScheme.secondary,
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
                    _renderRowItem(context, Icons.date_range,
                        DateFormat('yyyy-MM-dd').format(DateTime.parse(user.birthDate!)))
                  ]
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          _renderRowItem(context, Icons.phone_android, user.phoneNumber),
          const SizedBox(height: 8),
          _renderRowItem(context, Icons.monetization_on_outlined, user.sallary.toString())
        ],
      ),
    );
  }


}
