import 'package:flutter/material.dart';

import '../../../../../core/base/analytics/analytics.mixin.dart';
import '../../../../../core/i18n/translation.dart';
import '../../tag/logout_dialog.tag.dart';

class LogoutDialog extends StatelessWidget
    with AnalyticsMixin<LogoutDialogTag> {
  final void Function() onPressedYes;
  final StringsTranslations i18n;

  const LogoutDialog({
    super.key,
    required this.onPressedYes,
    required this.i18n,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(i18n.strings.home.logoutDialog.title),
      content: Text(i18n.strings.home.logoutDialog.content),
      actions: [
        TextButton(
          onPressed: () => onClickNoLogout(context),
          child: Text(i18n.strings.home.logoutDialog.buttonNo),
        ),
        TextButton(
          onPressed: onClickYesLogout,
          child: Text(i18n.strings.home.logoutDialog.buttonYes),
        ),
      ],
    );
  }

  void onClickYesLogout() async {
    await tag.onClickYesLogout(i18n.strings.home.logoutDialog.buttonYes);
    onPressedYes();
  }

  void onClickNoLogout(BuildContext context) async {
    await tag.onClickYesLogout(i18n.strings.home.logoutDialog.buttonNo);
    if (context.mounted) Navigator.of(context).pop();
  }
}
