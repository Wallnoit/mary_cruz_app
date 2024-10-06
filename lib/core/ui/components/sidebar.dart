import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';

class GlobalSidebar extends StatefulWidget {
  final SideBar selectedIndex;
  const GlobalSidebar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<GlobalSidebar> createState() => _GlobalSidebarState();
}

class RowSideBarObject {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isAcordeon;
  final Function()? onTap;

  RowSideBarObject({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.isAcordeon,
    required this.onTap,
  });
}

class _GlobalSidebarState extends State<GlobalSidebar> {
  get selectIndex => widget.selectedIndex;

  bool membershipOptions = false;
  bool paymentsOptions = false;

  SideBar? selected;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: Drawer(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      accountName: Text(
                        'William Perez',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      accountEmail: Text('william@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              )),
                      currentAccountPicture: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(12.0), // Radio de redondeo
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Center(
                            child: Text(
                              'WP',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  RowSidebar(
                    title: "Home",
                    icon: Icons.home_outlined,
                    isSelected: selectIndex == SideBar.home,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Candidatos",
                    icon: Icons.people_alt_outlined,
                    isSelected: selectIndex == SideBar.candidates,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Propuestas",
                    icon: Icons.assignment_outlined,
                    isSelected: selectIndex == SideBar.proposals,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Noticias",
                    icon: Icons.newspaper_outlined,
                    isSelected: selectIndex == SideBar.news,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Eventos",
                    icon: Icons.event_outlined,
                    isSelected: selectIndex == SideBar.events,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Testimonios",
                    icon: Icons.star_border_outlined,
                    isSelected: selectIndex == SideBar.testimony,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  RowSidebar(
                    title: "Opiniones",
                    icon: Icons.chat_outlined,
                    isSelected: selectIndex == SideBar.opinions,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/opinions"),
                  ),
                  RowSidebar(
                    title: "Encuesta",
                    icon: Icons.poll_outlined,
                    isSelected: selectIndex == SideBar.opinions,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("/"),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5),
                            height: 1,
                          )),
                      const SizedBox(
                        height: 1,
                      ),
                      RowSidebar(
                        title: "Logout",
                        icon: Icons.logout,
                        onTap: () => Get.offNamed("/login"),
                        isSelected: false,
                        isDisplayed: false,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class RowSidebar extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isDisplayed;
  final Function()? onTap;

  const RowSidebar({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.isDisplayed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        selected: isSelected,
        selectedTileColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
        leading: Icon(
          icon,
          size: 35,
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
