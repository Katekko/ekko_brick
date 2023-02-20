import 'package:flutter/material.dart';

import 'circular_loading.widget.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  const LoadingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        const CircularLoadingWidget(),
      ],
    );
  }
}
