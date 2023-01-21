import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/manager/provider/child/language_provider.dart';
import 'package:crud_mockio/product/validator/validator.dart';
import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:crud_mockio/product/widget/date_picker/date_picker_button.dart';
import 'package:crud_mockio/ui/home/subview/add_new_chef/viewmodel/add_new_chef_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddNewChef extends StatefulWidget {
  const AddNewChef({Key? key}) : super(key: key);

  @override
  State<AddNewChef> createState() => _AddNewChefState();
}

class _AddNewChefState extends State<AddNewChef> {
  final viewModel = getIt<IAddNewChefViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  TextFormField _renderFormField(
    BuildContext context, {
    required String labelText,
    String? Function(String? value)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      cursorColor: context.theme.colorScheme.tertiary,
      validator: (value) {
        if (validator == null) {
          return Validator.instance.isNotEmpty(value, context);
        } else {
          return validator.call(value);
        }
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  String getDateString(DateTime? dateTime) =>
      dateTime == null ? context.translate.birth_date : dateTime.toLocal().toString();

  Future<void> showPicker() async {
    final res = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    viewModel.changeSelectedDate(value: res);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
      title: Text(
        context.translate.add_new_chef,
        style: context.theme.textTheme.headline6?.copyWith(
          color: Colors.white,
        ),
      ),
      child: Form(
        key: viewModel.addFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _renderFormField(context, labelText: context.translate.name)),
                  const SizedBox(width: 12),
                  Expanded(child: _renderFormField(context, labelText: context.translate.surname)),
                ],
              ),
              const SizedBox(height: 12),
              _renderFormField(context, labelText: context.translate.identity),
              const SizedBox(height: 12),
              DatePickerButton(
                validator: (value) {
                  if (value == null) {
                    return context.translate.required;
                  } else {
                    return null;
                  }
                },
                hintText: context.translate.birth_date,
                formatter: DateFormat.yMMMMd(),
                locale: context.read<LanguageProvider>().currentLocale,
                onChanged: (value) {
                  viewModel.changeSelectedDate(value: value);
                },
                selectText: context.translate.ok,
                closeText: context.translate.cancel,
              ),
              const SizedBox(height: 12),
              _renderFormField(context, labelText: context.translate.phone_number),
              const SizedBox(height: 12),
              _renderFormField(
                context,
                labelText: context.translate.sallary,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (viewModel.addFormKey.currentState!.validate()) {}
                  },
                  child: Text(context.translate.ok),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
