import '../../../../../core/base/abstractions/field_interface.dart';
import '../../../../../core/base/builders/field_validator_builder.dart';
import '../../../../../core/base/dal/storage/storage_interface.dart';
import '../../../../../core/base/models/text_react_field.dart';
import '../../../core/resources/user/dal/datasource/user_datasource_interface.dart';
import '../../../core/resources/user/dal/user_repository.dart';
import '../../../core/base/inject.dart';
import '../presentation/tag/login_tag.dart';
import '../presentation/login_controller.dart';
import '../usecases/authenticate_user_usecase.dart';

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
  return TextReactField(
    validators: FieldValidatorBuilder<String>().required().build(),
  );
}

IField<String> makePasswordField() {
  return TextReactField(
    validators: FieldValidatorBuilder<String>().required().password().build(),
  );
}
