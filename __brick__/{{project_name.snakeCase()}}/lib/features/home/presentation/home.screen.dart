import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/base/style/colors.dart';
import '../../../core/navigation/routes.dart';
import '../../shared/loading/loading.widget.dart';
import '../../shared/view_controller.interface.dart';
import '../bindings/home_controller.interface.dart';
import 'widgets/dialogs/logout.dialog.dart';

class HomeScreen extends ViewStateController<IHomeController> {
  const HomeScreen({super.key});

  @override
  State<ViewStateController<IHomeController>> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Ekko Brick'),
        ),
        body: const Center(child: Text('Ekko Brick')),
      ),
    );
  }

  void logout() {
    showDialog(
      context: context,
      builder: (_) => LogoutDialog(
        onPressedYes: () {
          widget.controller.logout();
          context.goNamed(Routes.login);
        },
      ),
    );
  }
}
