import 'package:flutter/material.dart';

import '../../core/base/abstractions/field.interface.dart';

class CheckboxWidget extends StatelessWidget {
  final IField<bool> field;
  final IconData icon;
  final String label;
  const CheckboxWidget({
    super.key,
    required this.label,
    required this.field,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
      valueListenable: field.valueNotifier,
      builder: (context, snapshot, _) {
        return CheckboxListTile(
          value: snapshot,
          dense: true,
          onChanged: (val) => onChanged(val, context: context),
          checkColor: Colors.white,
          tileColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(right: 0, left: 10),
          secondary: Icon(icon, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }

  void onChanged(bool? val, {required BuildContext context}) {
    FocusScope.of(context).unfocus();
    field.valueNotifier.value = val!;
  }
}
