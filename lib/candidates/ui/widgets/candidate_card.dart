import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/candidates/provider/candidates_controller.dart';
import 'package:mary_cruz_app/core/models/candidates_model.dart';
import 'package:mary_cruz_app/core/ui/components/custom_chip.dart';

class CandidateCard extends StatefulWidget {
  final CandidatesModel candidate;

  const CandidateCard({super.key, required this.candidate});

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  CandidatesController controller = Get.find();
  get candidate => widget.candidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          controller.setCandidate(candidate);

          Get.toNamed('/candidates/candidate-description');
        },
        splashColor: Colors.grey,
        child: Row(children: [
          /*CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(candidate.imageAvatarSmall),
          ),*/
          Center(
                        child: ClipOval(
                          child: Image.network(
                            repeat: ImageRepeat.noRepeat,
                            candidate.imageAvatarSmall, 
                            width: ScreenUtil().setWidth(55), // Ancho del avatar
                            height: ScreenUtil().setHeight(70), // Alto del avatar
                            fit: BoxFit.contain, // Ajuste de la imagen
                          ),
                                  ),),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  candidate.name,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(height: 8),
                CustomChip(
                    color: Theme.of(context).colorScheme.primary,
                    label: candidate.role,
                    labelColor: Colors.white),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
