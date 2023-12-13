import 'package:flutter/material.dart';
import 'package:planet_system/services/ui/color_service.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.onSubmitted,
      this.textInputType = TextInputType.number,
      this.errorText});
  final TextEditingController controller;
  final void Function(String) onSubmitted;

  final String? errorText;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        errorText: widget.errorText,
      ),
      keyboardType: widget.textInputType,
      style: const TextStyle(color: Colors.white),
      onChanged: (value) {
        // updateErrorText(value);
        widget.onSubmitted(value);
      },
      onSubmitted: (value) {
        _focusNode.nextFocus();
      },
      textInputAction: TextInputAction.done,
      onEditingComplete: () {
        widget.onSubmitted(widget.controller.text);

        _focusNode.nextFocus();
      },
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
