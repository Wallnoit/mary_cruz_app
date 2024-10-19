import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/ui/components/custom_chip.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard({super.key});

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed('/candidates/candidate-description');
        },
        splashColor: Colors.grey,
        child: Row(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://www.eltiempo.com/files/image_640_428/uploads/2021/08/23/6123f4b1e3b3d.jpeg'),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mary Cruz Lascano',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(height: 8),
                CustomChip(
                    color: Theme.of(context).colorScheme.primary,
                    label: 'Rectora',
                    labelColor: Colors.white),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
