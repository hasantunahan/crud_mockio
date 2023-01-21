import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/constant/assets.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:crud_mockio/ui/home/subview/chef_detail/viewmodel/chef_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class ChefDetail extends StatefulWidget {
  final String userId;
  const ChefDetail({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  State<ChefDetail> createState() => _ChefDetailState();
}

class _ChefDetailState extends State<ChefDetail> {
  final viewModel = getIt<IChefDetailViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init(widget.userId);
  }

  Widget _renderBody() {
    if (viewModel.loading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else {
      return _renderDetails();
    }
  }

  Widget _renderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderContact(),
        _renderDivider(),
        _renderRowItem(
          context,
          viewModel.user?.id,
          "ID",
          Icons.numbers,
        ),
        _renderRowItem(
          context,
          viewModel.user?.identity,
          context.translate.identity,
          Icons.confirmation_number,
        ),
        _renderRowItem(
          context,
          DateFormat('yyyy-MM-dd').format(DateTime.parse(viewModel.user!.birthDate!)).toString(),
          context.translate.birth_date,
          Icons.date_range,
        ),
        _renderRowItem(
          context,
          viewModel.user?.phoneNumber,
          context.translate.phone_number,
          Icons.phone_android_outlined,
        ),
        const Spacer(),
        _renderDeleteUser(context),
      ],
    );
  }

  Widget _renderDeleteUser(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ElevatedButton(
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
                      viewModel.deleteUser(viewModel.user!.id!);
                    },
                    child: Text(context.translate.ok),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          context.translate.delete_chef,
        ),
      ),
    );
  }

  Padding _renderDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Divider(thickness: 1.6),
    );
  }

  Row _renderContact() {
    return Row(
      children: [
        Image.asset(
          Assets.instance.png.splashView,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        _renderText(context, viewModel.user?.name),
        const SizedBox(width: 8),
        _renderText(context, viewModel.user?.surname),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _renderRowItem(BuildContext context, String? value, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            _renderTextLarge(context, "$label  :  "),
            _renderTextLarge(context, value)
          ],
        ),
      ),
    );
  }

  Widget _renderTextLarge(BuildContext context, String? value) {
    return Text(value ?? context.translate.unknown, style: context.theme.textTheme.headline6);
  }

  Widget _renderText(BuildContext context, String? value) {
    return Text(value == null ? context.translate.unknown : value.toUpperCase(),
        style: context.theme.textTheme.headline6);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BaseWrapper(
          title: Text(
            context.translate.chef_information,
            style: context.theme.textTheme.headline6?.copyWith(
              color: Colors.white,
            ),
          ),
          child: _renderBody(),
        );
      },
    );
  }
}
