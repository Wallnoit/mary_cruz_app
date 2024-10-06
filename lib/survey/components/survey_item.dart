import 'package:flutter/material.dart';

class SurveyItem extends StatefulWidget {
  final int questionIndex;
  final String question;
  final List<String> options;

  const SurveyItem(
      {super.key,
      required this.questionIndex,
      required this.question,
      required this.options});

  @override
  State<SurveyItem> createState() => _SurveyItemState();
}

class _SurveyItemState extends State<SurveyItem> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // O usa Flexible aquí si prefieres
              child: Text(
                "${widget.questionIndex}. ${widget.question}",
                style: Theme.of(context).textTheme.titleMedium!,
                softWrap: true, // Asegura que el texto se envuelva
                overflow: TextOverflow
                    .visible, // Si prefieres que se muestre todo el texto
              ),
            ),
            Icon(Icons.favorite,
                color: Theme.of(context).colorScheme.primary, size: 29),
          ],
        ),
        const Divider(),
        Column(
          children: widget.options
              .map(
                (option) => RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(option,
                      style: Theme.of(context).textTheme.bodyMedium),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
