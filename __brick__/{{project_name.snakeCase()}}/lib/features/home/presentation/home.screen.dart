import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/base/mixins/analytics.mixin.dart';
import '../../../core/base/mixins/controller.mixin.dart';
import '../../../core/base/mixins/l10n.mixin.dart';
import '../../../core/base/style/colors.dart';
import '../../../core/navigation/routes.dart';
import '../../shared/loading/loading.widget.dart';
import 'home.controller.dart';
import 'tag/home.tag.dart';
import 'widgets/dialogs/logout.dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with ControllerMixin<HomeController>, AnalyticsMixin<HomeTag>, l10nMixin {
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
}
