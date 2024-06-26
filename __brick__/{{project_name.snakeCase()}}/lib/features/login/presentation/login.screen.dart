import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/base/style/colors.dart';
import '../../../../core/base/utils/snackbar.util.dart';
import '../../../../core/navigation/routes.dart';
import '../../../core/base/mixins/analytics.mixin.dart';
import '../../../core/base/mixins/controller.mixin.dart';
import '../../../core/base/mixins/l10n.mixin.dart';
import '../../../core/resources/user/domain/exceptions/user_or_password_incorrect.exception.dart';
import '../../shared/loading/loading.widget.dart';
import '../../shared/primary_button.widget.dart';
import '../../shared/text_field.widget.dart';
import 'tag/login.tag.dart';
import 'login.controller.dart';

class LoginScreen extends StatelessWidget
    with ControllerMixin<LoginController>, AnalyticsMixin<LoginTag>, l10nMixin {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.strings.login.title,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.strings.login.userNameLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(
                        label: l10n.strings.login.userNameLabel,
                        field: controller.loginField,
                        useLabelAsHint: true,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        l10n.strings.login.passwordLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(
                        label: l10n.strings.login.passwordLabel,
                        field: controller.passwordField,
                        useLabelAsHint: true,
                      ),
                      const SizedBox(height: 20.0),
                      PrimaryButtonWidget(
                        text: l10n.strings.login.loginButtonLabel,
                        onPressed: authenticateUser,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus();
      await tag.onLoginButtonClicked(l10n.strings.login.loginButtonLabel);
      final userId = await controller.authenticateUser();
      if (userId != null) {
        await tag.onLoginSucceed(userId);
        if (context.mounted) context.goNamed(Routes.home);
      }
    } on UserOrPasswordIncorrectException catch (err) {
      if (context.mounted) showErrorSnackbar(context: context, err: err);
    }
  }
}
