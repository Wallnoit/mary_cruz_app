import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownData {
  final String value;
  final String display;

  DropdownData({required this.value, required this.display});
}

class Dropdown extends StatefulWidget {
  final List<DropdownData> getData;
  final String value;
  final bool expanded;
  final double height;
  final Function(String) onSelected;
  final bool enabled;
  final String label;

  const Dropdown({
    super.key,
    required this.getData,
    required this.value,
    required this.height,
    required this.expanded,
    required this.onSelected,
    required this.enabled,
    required this.label,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Text(
            widget.label,
            style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        // Contenedor del dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: widget.expanded ? double.infinity : null,
          height: widget.height,
          decoration: BoxDecoration(
            color: const Color(0xFFF2EFEF),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              items: widget.getData.map((DropdownData item) {
                return DropdownMenuItem<String>(
                  value: item.value,
                  child: Text(
                    item.display,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: widget.enabled
                  ? (String? newValue) {
                setState(() {
                  _value = newValue!;
                });
                widget.onSelected(newValue!);
              }
                  : null,
              value: _value,
            ),
          ),
        ),
      ],
    );
  }
}
