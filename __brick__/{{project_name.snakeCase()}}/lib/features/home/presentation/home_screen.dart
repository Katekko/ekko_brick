import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/base/mixins/analytics_mixin.dart';
import '../../../core/base/mixins/controller_mixin.dart';
import '../../../core/base/mixins/l10n_mixin.dart';
import '../../../core/base/style/colors.dart';
import '../../../core/navigation/routes.dart';
import '../../shared/loading/loading_widget.dart';
import 'home_controller.dart';
import 'tag/home_tag.dart';
import 'widgets/dialogs/logout_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with ControllerMixin<HomeController>, AnalyticsMixin<HomeTag>, L10nMixin {
  void logout() {
    void onPressedYes() async {
      await controller.logout();
      await tag.onLogout();

      if (mounted) GoRouter.of(context).goNamed(Routes.login);
    }

    showDialog(
      context: context,
      builder: (_) => LogoutDialog(l10n: l10n, onPressedYes: onPressedYes),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        drawer: Drawer(
          backgroundColor: const Color(CColors.background),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: logout, child: const Text('Sair')),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(l10n.strings.home.title),
        ),
        body: Center(child: Text(l10n.strings.home.title)),
      ),
    );
  }
}
