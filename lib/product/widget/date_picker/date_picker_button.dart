import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "material_date_picker.dart";

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    required this.hintText,
    required this.formatter,
    required this.onChanged,
    required this.selectText,
    required this.closeText,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.labelText,
    this.borderColor,
    this.acceptNull = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.locale,
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  final DateTime? initialValue;
  final String? Function(DateTime? value)? validator;
  final void Function(DateTime? value)? onSaved;
  final void Function(DateTime? value) onChanged;
  final String? labelText;
  final Color? borderColor;
  final String hintText;
  final DateFormat formatter;
  final bool acceptNull;
  final AutovalidateMode autoValidateMode;
  final Locale? locale;
  final String closeText;
  final String selectText;
  final Color? backgroundColor;

  Future<DateTime?> _selectDate(BuildContext context, DateTime? date) async {
    return await CustomMaterialDatePicker.showPicker(
      initialDate: date,
      context: context,
      locale: locale ?? Localizations.localeOf(context),
      closeText: closeText,
      selectText: selectText,
    );
  }

  String _dateText(DateTime? value) {
    if (value == null) {
      return hintText;
    } else {
      return formatter.format(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormField<DateTime>(
      autovalidateMode: autoValidateMode,
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      builder: (field) {
        return InkWell(
          onTap: () async {
            final date = await _selectDate(context, field.value);
            if (date != null || acceptNull) {
              onChanged.call(date);
              field.didChange(date);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor ?? Colors.transparent,
              isDense: true,
              errorText: field.errorText,
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: borderColor ?? theme.colorScheme.onSurface,
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: borderColor ?? theme.colorScheme.secondary,
                  width: 0.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _dateText(field.value),
                    style: theme.textTheme.subtitle1!.copyWith(color: theme.colorScheme.secondary),
                  ),
                ),
                // renderVisibilityError(context),
              ],
            ),
          ),
        );
      },
    );
  }
}
