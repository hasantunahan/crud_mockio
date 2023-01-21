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

  TextFormField _renderFormField(
    BuildContext context, {
    required String labelText,
    String? Function(String? value)? validator,
    void Function(String value)? onChanged,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: context.theme.colorScheme.tertiary,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: (value) {
        if (validator == null) {
          return Validator.instance.isNotEmpty(value, context);
        } else {
          return validator.call(value);
        }
      },
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

  DatePickerButton _renderDatePicker(BuildContext context) {
    return DatePickerButton(
      validator: (value) {
        if (value == null) {
          return context.translate.required;
        } else {
          return null;
        }
      },
      autoValidateMode: AutovalidateMode.onUserInteraction,
      hintText: context.translate.birth_date,
      formatter: DateFormat.yMMMMd(),
      locale: context.read<LanguageProvider>().currentLocale,
      onChanged: (value) {
        viewModel.changeSelectedDate(value: value);
      },
      selectText: context.translate.ok,
      closeText: context.translate.cancel,
    );
  }

  Widget _renderBody(BuildContext context) {
    if (viewModel.loading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else {
      return _renderFormElement(context);
    }
  }

  Form _renderFormElement(BuildContext context) {
    return Form(
      key: viewModel.addFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: _renderFormField(
                  context,
                  labelText: context.translate.name,
                  onChanged: (value) {
                    viewModel.changeUserFromForm(viewModel.user.copyWith(
                      name: value,
                    ));
                  },
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: _renderFormField(
                  context,
                  onChanged: (value) {
                    viewModel.changeUserFromForm(viewModel.user.copyWith(
                      surname: value,
                    ));
                  },
                  labelText: context.translate.surname,
                )),
              ],
            ),
            const SizedBox(height: 12),
            _renderFormField(
              context,
              labelText: context.translate.identity,
              validator: (value) => Validator.instance.isTCKN(value, context),
              onChanged: (value) {
                viewModel.changeUserFromForm(viewModel.user.copyWith(
                  identity: value,
                ));
              },
            ),
            const SizedBox(height: 12),
            _renderDatePicker(context),
            const SizedBox(height: 12),
            _renderFormField(
              context,
              labelText: context.translate.phone_number,
              onChanged: (value) {
                viewModel.changeUserFromForm(viewModel.user.copyWith(
                  phoneNumber: value,
                ));
              },
            ),
            const SizedBox(height: 12),
            _renderFormField(
              context,
              labelText: context.translate.sallary,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                viewModel.changeUserFromForm(viewModel.user.copyWith(
                  sallary: int.tryParse(value),
                ));
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: context.width,
              child: ElevatedButton(
                onPressed: () {
                  if (viewModel.addFormKey.currentState!.validate()) {
                    viewModel.addNewChef();
                  }
                },
                child: Text(context.translate.ok),
              ),
            )
          ],
        ),
      ),
    );
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
      child: Observer(builder: (context) {
        return _renderBody(context);
      }),
    );
  }
}
