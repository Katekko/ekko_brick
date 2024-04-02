import '../../../../../core/base/abstractions/field.interface.dart';
import '../../../../../core/base/builders/field_validator.builder.dart';
import '../../../../../core/base/dal/storage/storage.interface.dart';
import '../../../../../core/base/models/text_react_field.model.dart';
import '../../../core/resources/user/dal/datasource/user.datasource.interface.dart';
import '../../../core/resources/user/dal/user.repository.dart';
import '../../../core/base/inject.dart';
import '../presentation/tag/login.tag.dart';
import '../presentation/login.controller.dart';
import '../usecases/authenticate_user.usecase.dart';

class LoginControllerBinding {
  static void inject() {
    Inject.injectController<LoginController>(makeLoginController);
    Inject.lazyPut<LoginTag>(makeLoginTag);
  }

  static void dipose() {
    Inject.disposeController<LoginController>();
    Inject.remove<LoginTag>();
  }
}

LoginController makeLoginController() {
  final storage = Inject.find<IStorage>();
  final authDatasource = Inject.find<IUserDatasource>();

  final userRepository = UserRepository(
    storage: storage,
    userDatasource: authDatasource,
  );

  final authenticateUserUsecase = AuthenticateUserUsecase(
    userRepository: userRepository,
  );

  return LoginController(
    loginField: makeLoginField(),
    passwordField: makePasswordField(),
    authenticateUserUsecase: authenticateUserUsecase,
  );
}

LoginTag makeLoginTag() {
  return LoginTag(Inject.find());
}

IField<String> makeLoginField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}

IField<String> makePasswordField() {
  return TextReactFieldModel(
    validators: FieldValidatorBuilder<String>().required().password().build(),
  );
}
