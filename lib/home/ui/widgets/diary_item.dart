import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  String dayName = '///';
  String monthName = '///';

  bool isToday = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    compareDate();
    getDateName();
  }

  getDateName() async {
    String dayName = await getDayName(diary.date);
    String monthName = await getMonthName(diary.date);

    setState(() {
      this.dayName = dayName;
      this.monthName = monthName;
    });
  }

  compareDate() {
    final now = DateTime.now().toUtc();
    final date = DateTime(now.year, now.month, now.day);

    final diaryDate =
        DateTime(diary.date.year, diary.date.month, diary.date.day);

    if (date == diaryDate) {
      setState(() {
        isToday = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 0.2,
                ),
                top: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 0.2,
                ),
              ),
            ),
            child: Column(
              children: [
                // Título
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(diary.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                    ),
                    Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 30),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Primera columna - Fecha
                    Flexible(
                      flex: 1, // Flexibilidad para controlar el espacio
                      child: Column(
                        children: [
                          Text(capitalizeFirstLetter(dayName).substring(0, 3),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: isToday
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary)),
                          Text(diary.date.day.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      color: isToday
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary)),
                        ],
                      ),
                    ),
                    // Segunda columna - Hora y ubicación
                    Expanded(
                      flex:
                          2, // Flex más grande para que esta sección sea más ancha
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time_filled,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  size: 20),
                              const SizedBox(width: 3),
                              Text("${diary.initTime} - ${diary.endTime}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  size: 22),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(diary.place,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: Animate(
              effects: const [FadeEffect(), SlideEffect()],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(diary.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
