import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .start, // Para que alinee el texto hacia arriba si es multilinea
      children: [
        Icon(
          icon,
          size: 31,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            softWrap:
                true, // Permite que el texto salte de línea si es necesario
            overflow: TextOverflow.clip, // Controla si el texto se corta o no
          ),
        ),
      ],
    );
  }
}
