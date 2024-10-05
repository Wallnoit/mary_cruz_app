import 'package:flutter/material.dart';

class AuxiliarButton extends StatefulWidget {
  final double size;
  final IconData icon;
  final Function onPressed;

  const AuxiliarButton(
      {super.key,
      required this.size,
      required this.icon,
      required this.onPressed});

  @override
  State<AuxiliarButton> createState() => _AuxiliarButtonState();
}

class _AuxiliarButtonState extends State<AuxiliarButton> {
  get size => widget.size;
  get icon => widget.icon;
  get onPressed => widget.onPressed;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPressed
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          onPressed();
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Icon(
          icon,
          size: size - 10,
          color: isPressed
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
