// ignore_for_file: constant_identifier_names
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

const double _DEFAULT_IOS_HEIGHT = 216;

class CustomCupertinoDatePicker extends StatefulWidget {
  const CustomCupertinoDatePicker({
    required this.onSelected,
    Key? key,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.closeText,
    this.selectText,
  }) : super(key: key);

  final DateTime? initialDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final String? closeText;
  final String? selectText;
  final Function(DateTime? dateTime)? onSelected;

  @override
  State<CustomCupertinoDatePicker> createState() => _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  DateTime? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialDateTime;
  }

  Row renderTopView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (selected == DateTime.now()) {
              setState(() {
                selected = null;
              });
            }
            Navigator.pop(context);
          },
          child: Text(widget.closeText ?? "Close"),
        ),
        TextButton(
          onPressed: () {
            widget.onSelected!(selected);
            Navigator.pop(context);
          },
          child: Text(widget.selectText ?? "Select"),
        ),
      ],
    );
  }

  Flexible renderPicker() {
    return Flexible(
      child: CupertinoDatePicker(
        initialDateTime: widget.initialDateTime,
        minimumDate: widget.minimumDate,
        maximumDate: widget.maximumDate,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (value) {
          setState(() {
            selected = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        height: _DEFAULT_IOS_HEIGHT,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: renderTopView(context),
            ),
            const SizedBox(height: 4),
            renderPicker(),
          ],
        ),
      ),
    );
  }
}
