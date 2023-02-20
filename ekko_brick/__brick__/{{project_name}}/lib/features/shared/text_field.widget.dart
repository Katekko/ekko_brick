import 'package:flutter/material.dart';

import '../../core/abstractions/field.interface.dart';

class TextFieldWidget extends StatelessWidget {
  final IField field;
  const TextFieldWidget({required this.field, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: field.errorStream,
      builder: (_, snapshot) {
        return TextFormField(
          controller: field.controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF15455C).withOpacity(.5),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA49D85), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFF1F0D7), width: 1),
            ),
            // errorText: snapshot.data,
          ),
        );
      },
    );
  }
}
