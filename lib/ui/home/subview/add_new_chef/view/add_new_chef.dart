import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:flutter/material.dart';

class AddNewChef extends StatefulWidget {
  const AddNewChef({Key? key}) : super(key: key);

  @override
  State<AddNewChef> createState() => _AddNewChefState();
}

class _AddNewChefState extends State<AddNewChef> {
  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
      title: Text(
        context.translate.add_new_chef,
        style: context.theme.textTheme.headline6?.copyWith(
          color: Colors.white,
        ),
      ),
      child: const Center(),
    );
  }
}
