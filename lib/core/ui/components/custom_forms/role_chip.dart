import 'package:flutter/material.dart';

class RoleChip extends StatefulWidget {
  final Color color;
  final String label;
  final Color labelColor;

  const RoleChip(
      {super.key,
      required this.color,
      required this.label,
      required this.labelColor});

  @override
  State<RoleChip> createState() => _RoleChipState();
}

class _RoleChipState extends State<RoleChip> {
  get color => widget.color;
  get label => widget.label;
  get labelColor => widget.labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: labelColor, fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
