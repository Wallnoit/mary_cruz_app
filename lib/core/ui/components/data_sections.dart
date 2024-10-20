import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DataSections extends StatefulWidget {
  final String sectionTitle;
  final List<Widget> sectionData;

  const DataSections(
      {super.key, required this.sectionTitle, required this.sectionData});

  @override
  State<DataSections> createState() => _DataSectionsState();
}

class _DataSectionsState extends State<DataSections> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.sectionTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    size: 35)),
          ],
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          thickness: 2,
        ),
        const SizedBox(height: 15),
        Visibility(
          visible: isExpanded,
          child: Animate(
            effects: const [FadeEffect(), SlideEffect()],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.sectionData.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: e,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
