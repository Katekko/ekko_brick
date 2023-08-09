import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/base/abstractions/field.interface.dart';
import '../../core/base/style/colors.dart';

class DatePickerWidget extends StatelessWidget {
  final IField<DateTime> field;
  const DatePickerWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: field.errorStream,
      builder: (_, snap, ___) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PickerWidget(field: field),
          Visibility(
            visible: snap != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                snap ?? '',
                style: TextStyle(color: Colors.red[700], fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PickerWidget extends StatelessWidget {
  final IField<DateTime> field;
  const _PickerWidget({required this.field});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: field.valueNotifier,
      builder: (_, snap, ___) => Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () => onPressed(context),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    snap == null
                        ? 'Selecione uma data*'
                        : DateFormat('dd/MM/yyyy').format(snap),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final theme = Theme.of(context);
    final date = await showDatePicker(
      context: context,
      initialDate: field.valueNotifier.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: const Color(CColors.background),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      field.valueNotifier.value = date;
    }
  }
}
