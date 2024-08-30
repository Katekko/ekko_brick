import 'package:flutter/material.dart';

import 'circular_loading_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.child});
  
  final Widget child;

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
