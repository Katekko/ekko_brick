import 'package:flutter/material.dart';

import '../../core/inject.dart';

abstract class ViewStateController<T extends Object> extends StatefulWidget {
  T get controller => Inject.find<T>();

  const ViewStateController({super.key});

  @override
  State<ViewStateController<T>> createState();
}

abstract class ViewController<T extends Object> extends StatelessWidget {
  const ViewController({super.key});

  T get controller => Inject.find<T>();

  @override
  Widget build(BuildContext context);
}
