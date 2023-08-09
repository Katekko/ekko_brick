import 'package:flutter/material.dart';

import '../../core/i18n/translation.dart';
import '../../core/base/inject.dart';

abstract class ViewStateController<T extends Object> extends StatefulWidget {
  T get controller => Inject.find<T>();
  StringsTranslations get translations => Inject.find<StringsTranslations>();

  const ViewStateController({super.key});

  @override
  State<ViewStateController<T>> createState();
}

abstract class ViewController<T extends Object> extends StatelessWidget {
  T get controller => Inject.find<T>();
  StringsTranslations get i18n => Inject.find<StringsTranslations>();

  const ViewController({super.key});

  @override
  Widget build(BuildContext context);
}
