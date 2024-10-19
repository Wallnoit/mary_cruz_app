import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/ui/components/custom_chip.dart';
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
  final youtubeVideo = 'https://www.youtube.com/watch?v=gkZ4dLMH-B8';
  late YoutubePlayerController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeVideo)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
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
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: getContainerWidth(context) * 0.6,
                    color: Colors.red,
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
                    top: getContainerWidth(context) * 0.6 - 50,
                    left: 0,
                    right: 0, // Centrado
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getContainerWidth(context) * 0.30),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Mary Cruz Lascano ',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomChip(
                        color: Theme.of(context).colorScheme.primary,
                        label: 'Rectora',
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
                          InkWell(
                            onTap: () {
                              final String url = Uri.encodeFull(
                                  'https://www.facebook.com/people/Mary-Cruz/61565950187878/');

                              launchURL(url);
                            },
                            child: Image.asset(
                              'lib/assets/fb.png', // Ruta de la imagen
                              width: 40, // Establece el ancho
                              height: 40, // Establece la altura
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              final String url = Uri.encodeFull(
                                  'https://www.instagram.com/marycruzlascano/');

                              launchURL(url);
                            },
                            child: Image.asset(
                              'lib/assets/insta.png', // Ruta de la imagen
                              width: 40, // Establece el ancho
                              height: 40, // Establece la altura
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              final String url = Uri.encodeFull(
                                  'https://www.tiktok.com/@marycruzlascano');

                              launchURL(url);
                            },
                            child: Image.asset(
                              'lib/assets/tiktok.png', // Ruta de la imagen
                              width: 40, // Establece el ancho
                              height: 40, // Establece la altura
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
                    const DataSections(sectionTitle: "Academico", sectionData: [
                      CustomRow(
                          icon: Icons.school_outlined,
                          text: 'Ingeniera de sistemas'),
                      CustomRow(
                          icon: Icons.school_outlined,
                          text: 'Ingeniera de sistemas asd asdasdasd'),
                      CustomRow(
                          icon: Icons.school_outlined,
                          text: 'Ingeniera de sistemas asd'),
                    ]),

                    const SizedBox(height: 30),

                    const DataSections(
                        sectionTitle: "Experiencia",
                        sectionData: [
                          CustomRow(
                              icon: Icons.work_outline,
                              text: 'Ingeniera de sistemas'),
                          CustomRow(
                              icon: Icons.work_outline,
                              text: 'Ingeniera de sistemas asd asdasdasd'),
                          CustomRow(
                              icon: Icons.work_outline,
                              text: 'Ingeniera de sistemas asd'),
                        ]),

                    const SizedBox(height: 30),

                    DataSections(sectionTitle: "Investigaciones", sectionData: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 21),
                          ),
                          const SizedBox(height: 5),
                          Text('12/12/2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  )),
                          const SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
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
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 21),
                          ),
                          const SizedBox(height: 5),
                          Text('12/12/2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  )),
                          const SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
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
                      )
                    ]),

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
