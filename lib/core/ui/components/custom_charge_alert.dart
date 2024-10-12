import 'package:flutter/material.dart';

class CustomChargeAlert extends StatefulWidget {
  final String message;
  const CustomChargeAlert({super.key, required this.message});

  @override
  State<CustomChargeAlert> createState() => _CustomChargeAlertState();
}

class _CustomChargeAlertState extends State<CustomChargeAlert> {
  get message => widget.message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 16), // Espacio entre el indicador y el texto
          if (message != null)
            Text(message!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
