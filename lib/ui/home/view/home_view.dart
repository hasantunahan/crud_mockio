import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:crud_mockio/ui/home/view/part/user_item.dart';
import 'package:crud_mockio/ui/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = getIt<IHomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  ListView _renderListOfUser() {
    return ListView.builder(
      itemCount: viewModel.listOfUser!.length,
      itemBuilder: (context, index) {
        final user = viewModel.listOfUser![index];
        return UserItem(user: user);
      },
    );
  }

  Widget _renderUserNotFound() {
    return Center(
      child: Row(
        children: [
          const Icon(
            Icons.error,
          ),
          const SizedBox(width: 8),
          Text(context.translate.user_not_found),
        ],
      ),
    );
  }

  Widget _renderLoading() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget _renderBody() {
    if (viewModel.loading) {
      return _renderLoading();
    } else {
      if (viewModel.listOfUser?.isNotEmpty == false) {
        return _renderUserNotFound();
      } else {
        return _renderListOfUser();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
      title: Text(
        context.translate.chef_management,
        style: context.theme.textTheme.headline6?.copyWith(
          color: Colors.white,
        ),
      ),
      child: Observer(builder: (context) {
        return _renderBody();
      }),
    );
  }
}
