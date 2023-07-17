import 'package:flutter/material.dart';

import '../../../../core/abstractions/field.interface.dart';
import '../../../../core/builders/field_validator.builder.dart';
import '../../../../core/inject.dart';
import '../../../../core/models/react_field.model.dart';
import '../../presentation/home.controller.dart';
import 'home_controller.interface.dart';

class HomeControllerBinding {
  static void inject() {
    Inject.injectController<IHomeController>(makeHomeController);
  }

  static void dipose() {
    Inject.disposeController<IHomeController>();
  }
}

IHomeController makeHomeController() => const HomeController();

IField<String> makeNameField() {
  return ReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
    controller: TextEditingController(),
  );
}
