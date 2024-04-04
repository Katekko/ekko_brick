import 'package:flutter/material.dart';

import '../../../../../core/base/mixins/analytics.mixin.dart';
import '../../../../../core/l10n/translation.dart';
import '../../tag/logout_dialog.tag.dart';

class LogoutDialog extends StatelessWidget
    with AnalyticsMixin<LogoutDialogTag> {
  final void Function() onPressedYes;
  final StringsTranslations l10n;

  const LogoutDialog({
    super.key,
    required this.onPressedYes,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(l10n.strings.home.logoutDialog.title),
      content: Text(l10n.strings.home.logoutDialog.content),
      actions: [
        TextButton(
          onPressed: () => onClickNoLogout(context),
          child: Text(l10n.strings.home.logoutDialog.buttonNo),
        ),
        TextButton(
          onPressed: onClickYesLogout,
          child: Text(l10n.strings.home.logoutDialog.buttonYes),
        ),
      ],
    );
  }

  void onClickYesLogout() async {
    await tag.onClickYesLogout(l10n.strings.home.logoutDialog.buttonYes);
    onPressedYes();
  }

  void onClickNoLogout(BuildContext context) async {
    await tag.onClickYesLogout(l10n.strings.home.logoutDialog.buttonNo);
    if (context.mounted) Navigator.of(context).pop();
  }
}
