import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextField extends StatefulWidget {
  final RegExp regex;
  final TextInputType inputType;
  final double fontSize;
  final double radius;
  final TextEditingController valueController;
  final bool enabled;

  const CustomTextField(
      {super.key,
        required this.regex,
        required this.inputType,
        required this.fontSize,
        required this.radius,
        required this.valueController,
        required this.enabled,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  get regex => widget.regex;

  get inputType => widget.inputType;

  get fontSize => widget.fontSize;

  get radius => widget.radius;

  get valueController => widget.valueController;

  get enabled => widget.enabled;

  @override
  void dispose() {
    if (mounted) {
      valueController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      enabled: enabled ? true : false,
      cursorColor: const Color(0xff58534C),
      style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 2, left: 8, right: 8),
        filled: true,
        fillColor: const Color(0xFFF2EFEF),
        hintText: '',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: inputType,
      controller: valueController,
      validator: (value) {
        widget.regex.hasMatch(value!);
        if (value == null || value.isEmpty) {
          return 'Este campo es requerido';
        }
        return null;
      },
    );
  }

}
