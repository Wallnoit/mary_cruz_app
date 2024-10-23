import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/models/section_per_month_model.dart';
import 'package:mary_cruz_app/core/utils/utils.dart';
import 'package:mary_cruz_app/home/ui/widgets/diary_item.dart';

class SectionPerMonth extends StatefulWidget {
  final SectionPerMonthModel sectionPerMonth;
  const SectionPerMonth({super.key, required this.sectionPerMonth});

  @override
  State<SectionPerMonth> createState() => _SectionPerMonthState();
}

class _SectionPerMonthState extends State<SectionPerMonth> {
  SectionPerMonthModel get sectionPerMonth => widget.sectionPerMonth;

  String monthName = '';

  @override
  void initState() {
    super.initState();
    getNameMonth();
  }

  getNameMonth() async {
    DateTime date = DateTime(2024, sectionPerMonth.month, 1);

    String monthName = await getMonthName(date);
    setState(() {
      this.monthName = monthName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                capitalizeFirstLetter(monthName),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ],
          ),
        ),
        Column(
          children: sectionPerMonth.diaryList.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: DiaryItem(diary: e),
            );
          }).toList(),
        ),
      ],
    );
  }
}
