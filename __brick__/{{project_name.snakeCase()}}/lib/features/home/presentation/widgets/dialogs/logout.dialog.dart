import 'package:flutter/material.dart';

import '../../../../../core/i18n/translation.dart';

class LogoutDialog extends StatelessWidget {
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(i18n.strings.home.logoutDialog.buttonNo),
        ),
        TextButton(
          onPressed: onPressedYes,
          child: Text(i18n.strings.home.logoutDialog.buttonYes),
        ),
      ],
    );
  }
}
