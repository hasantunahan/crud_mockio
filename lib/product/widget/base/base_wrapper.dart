import 'package:flutter/material.dart';

class BaseWrapper extends StatelessWidget {
  final Widget child;
  final Widget? title;
  const BaseWrapper({
    Key? key,
    required this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
