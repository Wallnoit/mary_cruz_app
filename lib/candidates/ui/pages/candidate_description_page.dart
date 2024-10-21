import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/candidates/provider/candidates_controller.dart';
import 'package:mary_cruz_app/core/models/candidates_model.dart';
import 'package:mary_cruz_app/core/ui/components/custom_chip.dart';
import 'package:mary_cruz_app/core/ui/components/custom_forms/role_chip.dart';
import 'package:mary_cruz_app/core/ui/components/custom_row.dart';
import 'package:mary_cruz_app/core/ui/components/data_sections.dart';
import 'package:mary_cruz_app/core/utils/screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CandidateDescriptionPage extends StatefulWidget {
  const CandidateDescriptionPage({super.key});

  @override
  State<CandidateDescriptionPage> createState() =>
      _CandidateDescriptionPageState();
}

class _CandidateDescriptionPageState extends State<CandidateDescriptionPage> {
  CandidatesController candidateController = Get.find();

  late YoutubePlayerController controller;
  late CandidatesModel candidate;

  @override
  void initState() {
    candidate = candidateController.candidate.value;

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(candidate.urlVideo)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: true,
      ),
    );

    super.initState();
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode
              .externalApplication); // Usa el modo para abrir en un navegador externo
    } else {
      throw 'No se pudo abrir la URL $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (isLoading) {
    //   return const Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: getContainerWidth(context) * 0.6,
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: false,
                      progressIndicatorColor: Colors.transparent,
                      bottomActions: [],
                      controlsTimeOut: const Duration(seconds: 3),
                    ),
                  ),
                  // Boton de regreso
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back_ios, size: 35),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: getContainerWidth(context) * 0.6 - 55, //50
                    left: 0,
                    right: 0, // Centrado
                    child: /*CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        candidate.imageAvatarBig,
                      ),
                    ),*/Center(
                        child: ClipOval(
                          child: Image.network(
                            repeat: ImageRepeat.noRepeat,
                            candidate.imageAvatarBig, 
                            width: ScreenUtil().setWidth(105), // Ancho del avatar
                            height: ScreenUtil().setHeight(135), // Alto del avatar
                            fit: BoxFit.contain, // Ajuste de la imagen
                          ),
                                  ),),
                  ),
                ],
              ),
              SizedBox(height: getContainerWidth(context) * 0.30),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      candidate.name,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '"${candidate.phrase}"',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    RoleChip(
                        color: Theme.of(context).colorScheme.secondary,
                        label: candidate.role,
                        labelColor: Colors.white),
                    const SizedBox(height: 20),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.8),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: candidate.facebook != null,
                            child: InkWell(
                              onTap: () {
                                final String url =
                                    Uri.encodeFull(candidate.facebook!);

                                launchURL(url);
                              },
                              child: Image.asset(
                                'lib/assets/fb.png', // Ruta de la imagen
                                width: 40, // Establece el ancho
                                height: 40, // Establece la altura
                              ),
                            ),
                          ),
                          Visibility(
                            visible: candidate.instagram != null,
                            child: InkWell(
                              onTap: () {
                                final String url =
                                    Uri.encodeFull(candidate.instagram!);

                                launchURL(url);
                              },
                              child: Image.asset(
                                'lib/assets/insta.png', // Ruta de la imagen
                                width: 40, // Establece el ancho
                                height: 40, // Establece la altura
                              ),
                            ),
                          ),
                          Visibility(
                            visible: candidate.tiktok != null,
                            child: InkWell(
                              onTap: () {
                                final String url =
                                    Uri.encodeFull(candidate.tiktok!);

                                launchURL(url);
                              },
                              child: Image.asset(
                                'lib/assets/tiktok.png', // Ruta de la imagen
                                width: 40, // Establece el ancho
                                height: 40, // Establece la altura
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.8),
                    ),

                    const SizedBox(height: 40),

                    // Sección de formación académica
                    Visibility(
                      visible: candidate.visibleAcademico,
                      child: DataSections(
                        sectionTitle: "Academico",
                        sectionData: candidate.academicFormation
                            .map((e) =>
                                CustomRow(icon: Icons.school_outlined, text: e))
                            .toList(),
                      ),
                    ),

                    const SizedBox(height: 30),
                    Visibility(
                      visible: candidate.visibleExperiencia,
                      child: DataSections(
                          sectionTitle: "Experiencia",
                          sectionData: candidate.workExperience
                              .map((e) =>
                                  CustomRow(icon: Icons.work_outline, text: e))
                              .toList()),
                    ),

                    const SizedBox(height: 30),

                    Visibility(
                      visible: candidate.visibleInvestigaciones,
                      child: DataSections(
                          sectionTitle: "Investigaciones",
                          sectionData: candidate.investigations!
                              .map<Widget>(
                                (e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 21),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                        e
                                            .publicationDate, // Assuming the correct getter is 'publicationDate'
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            )),
                                    const SizedBox(height: 10),
                                    Text(
                                      e.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 100),
                                        child: Divider(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              )
                              .toList()),
                    ),

                    // Sección de experiencia laboral
                  ],
                ),
              )
              // Espacio debajo del avatar
            ],
          ),
        ),
      ),
    );
  }
}
