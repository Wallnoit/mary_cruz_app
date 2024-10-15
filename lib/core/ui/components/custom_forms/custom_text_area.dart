import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextArea extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextArea({super.key, required this.label, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Text(
            label,
            style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: 8,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xffF2EFEF),
          ),
        ),
      ],
    );
  }
}