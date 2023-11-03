import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.controller, required this.onSubmitted});
  final TextEditingController controller;
  final void Function(String) onSubmitted;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: _focusNode,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 247, 249, 249)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 168, 170, 170)),
        ),
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      onSubmitted: (value) {
        _focusNode.nextFocus();
        onSubmitted(value);
      },
    );
  }
}
