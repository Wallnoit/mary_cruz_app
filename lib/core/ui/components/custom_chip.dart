import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  final Color color;
  final String label;
  final Color labelColor;
  const CustomChip(
      {super.key,
      required this.color,
      required this.label,
      required this.labelColor});

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  get color => widget.color;
  get label => widget.label;
  get labelColor => widget.labelColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: labelColor, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
