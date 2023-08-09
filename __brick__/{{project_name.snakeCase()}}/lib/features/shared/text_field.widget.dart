import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/base/abstractions/field.interface.dart';
import '../../core/base/validators/password_field.validator.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final IField field;
  final bool useLabelAsHint;
  final bool onlyNumber;

  const TextFieldWidget({
    required this.label,
    required this.field,
    super.key,
    this.useLabelAsHint = false,
    this.onlyNumber = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.field.errorStream,
      builder: (_, snapshot, __) {
        return TextFormField(
          controller: widget.field.controller,
          textInputAction: TextInputAction.next,
          keyboardType:
              widget.onlyNumber ? TextInputType.number : TextInputType.text,
          obscureText:
              widget.field.validators.any((e) => e is PasswordFieldValidator),
          style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
          inputFormatters: [
            if (widget.onlyNumber)
              FilteringTextInputFormatter.allow(RegExp(r'[0-9,\.]')),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2E2E2E),
            labelText: widget.useLabelAsHint ? null : widget.label,
            labelStyle: const TextStyle(color: Color(0xFFBEBEBE), fontSize: 16),
            hintText: widget.useLabelAsHint ? widget.label : null,
            hintStyle: const TextStyle(color: Color(0xFFBEBEBE), fontSize: 16),
            errorText: snapshot,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
