import 'dart:math';
import 'package:flutter/material.dart';

class HeartsScore extends StatefulWidget {
  const HeartsScore({super.key});

  @override
  State<HeartsScore> createState() => _HeartsScoreState();
}

class _HeartsScoreState extends State<HeartsScore> {
  late double _randomRating;
  late int _randomVotes;

  @override
  void initState() {
    super.initState();
    _generateRandomRatingAndVotes();
  }

  void _generateRandomRatingAndVotes() {
    final List<double> possibleRatings = [4, 4.5, 5];
    _randomRating = possibleRatings[Random().nextInt(possibleRatings.length)];

    _randomVotes = 15 + Random().nextInt(186);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < _randomRating.floor(); i++)
              Icon(
                Icons.favorite,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            if (_randomRating == 4.5)
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
            for (var i = _randomRating.floor() + (_randomRating == 4.5 ? 1 : 0); i < 5; i++)
              Icon(
                Icons.favorite_border,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                '($_randomVotes votos)', // Mostrar el número de votos entre paréntesis
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Reducimos el radio para hacer más pequeño el borde
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Reducimos el padding
                  minimumSize: Size(80, 32), // Tamaño mínimo más pequeño
                ),
                onPressed: _showRatingDialog,
                child: Text(
                  'Calificar',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith( // Reducimos el tamaño de la fuente
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showRatingDialog() async {
    int tempRating = _randomRating.floor();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Califica esta noticia', style: Theme.of(context).textTheme.titleMedium),
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
                              tempRating = index + 1;
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
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancelar',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
}
