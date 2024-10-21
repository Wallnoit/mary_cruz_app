import 'package:flutter/material.dart';

class HeartsScore extends StatefulWidget {
  const HeartsScore({super.key});

  @override
  State<HeartsScore> createState() => _HeartsScoreState();
}

class _HeartsScoreState extends State<HeartsScore> {
  int _selectedRating = 0;

  Future<void> _showRatingDialog() async {
    int tempRating = _selectedRating;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calificar esta noticia', style: Theme.of(context).textTheme.titleMedium,),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < tempRating
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          iconSize: 40,
                          onPressed: () {
                            setState(() {
                              tempRating =
                                  index + 1; // Actualiza la calificación seleccionada
                            });
                          },
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Guardar',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancelar',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < 4; i++)
              Icon(
                Icons.favorite,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            Stack(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.5, // Muestra solo la mitad del corazón
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: _showRatingDialog,
              child: Text('Calificar',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ],
    );
  }
}
