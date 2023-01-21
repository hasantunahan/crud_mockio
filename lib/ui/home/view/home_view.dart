import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/config/navigation/navigation_service.dart';
import 'package:crud_mockio/product/constant/app_key.dart';
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

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver, RouteAware {
  final viewModel = getIt<IHomeViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NavigationService.instance.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    NavigationService.instance.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.fetchUser();
  }

  Widget _renderListOfUser() {
    return RefreshIndicator(
      onRefresh: () async {
        viewModel.fetchUser();
      },
      child: ListView.builder(
        key: AppKey.instance.chefsListView,
        shrinkWrap: true,
        itemCount: viewModel.listOfUser!.length,
        itemBuilder: (context, index) {
          final user = viewModel.listOfUser![index];
          return UserItem(
            user: user,
            viewModel: viewModel,
          );
        },
      ),
    );
  }

  Widget _renderUserNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
              ),
              const SizedBox(width: 8),
              Text(context.translate.user_not_found),
            ],
          ),
          const SizedBox(height: 12),
          _renderAddNewChef(),
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
        return Column(
          children: [
            _renderAddNewChef(),
            const SizedBox(height: 8),
            Expanded(
              child: _renderListOfUser(),
            ),
          ],
        );
      }
    }
  }

  Widget _renderAddNewChef() {
    return SizedBox(
      width: context.width,
      child: ElevatedButton(
        key: AppKey.instance.addNewChef,
        onPressed: () {
          viewModel.goAddNewChef();
        },
        child: Text(context.translate.add_new_chef),
      ),
    );
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
