import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  final Color color;
  final String label;
  const CustomChip({super.key, required this.color, required this.label});

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  get color => widget.color;
  get label => widget.label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: color[900], fontSize: 12),
      ),
    );
  }
}
