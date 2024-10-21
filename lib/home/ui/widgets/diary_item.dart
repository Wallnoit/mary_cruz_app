import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/models/diary_model.dart';
import 'package:mary_cruz_app/core/utils/utils.dart';

class DiaryItem extends StatefulWidget {
  final DiaryModel diary;
  const DiaryItem({super.key, required this.diary});

  @override
  State<DiaryItem> createState() => _DiaryItemState();
}

class _DiaryItemState extends State<DiaryItem> {
  DiaryModel get diary => widget.diary;

  bool isToday = false;
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    compareDate();
  }

  compareDate() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    final diaryDate = DateTime(
      2024,
      diary.month,
      diary.day,
    );

    if (date == diaryDate) {
      setState(() {
        isToday = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1,
          ),
          top: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Primera columna - Fecha
          Flexible(
            flex: 1, // Flexibilidad para controlar el espacio
            child: Column(
              children: [
                Text(diary.dayName,
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 10),
                Text(diary.day.toString(),
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
          // Segunda columna - Hora y ubicación
          Expanded(
            flex: 2, // Flex más grande para que esta sección sea más ancha
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time_filled,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 20),
                    const SizedBox(width: 3),
                    Text(diary.timeRange,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.tertiary)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 22),
                    const SizedBox(width: 3),
                    Text(fixedString(diary.place, 12),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.tertiary)),
                  ],
                ),
              ],
            ),
          ),
          // Tercera columna - Título
          Flexible(
            flex: 2, // Ajusta el flex para que esta sección ocupe menos espacio
            child: Text(
              'TITULO ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}
