import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/utils/screen_utils.dart';

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
                  SizedBox(
                    width: getContainerWidth(context) * 0.6,
                    child: UserAccountsDrawerHeader(
                        accountName: const Text(
                          '',
                        ),
                        accountEmail: const Text(
                          '',
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/logo.png'),
                              fit: BoxFit.cover,
                            ))),
                  ),
                  SizedBox(
                    height: 5.h,
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
                    onTap: () => Get.offNamed("candidates"),
                  ),
                  RowSidebar(
                    title: "Propuestas",
                    icon: Icons.assignment_outlined,
                    isSelected: selectIndex == SideBar.proposals,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("proposals"),
                  ),
                  RowSidebar(
                    title: "Noticias",
                    icon: Icons.newspaper_outlined,
                    isSelected: selectIndex == SideBar.news,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("news"),
                  ),
                  RowSidebar(
                    title: "Eventos",
                    icon: Icons.event_outlined,
                    isSelected: selectIndex == SideBar.events,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("events"),
                  ),
                  RowSidebar(
                    title: "Testimonios",
                    icon: Icons.star_border_outlined,
                    isSelected: selectIndex == SideBar.testimony,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("testimony"),
                  ),
                  RowSidebar(
                    title: "Opiniones",
                    icon: Icons.chat_outlined,
                    isSelected: selectIndex == SideBar.opinions,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("opinions"),
                  ),
                  RowSidebar(
                    title: "Encuesta",
                    icon: Icons.poll_outlined,
                    isSelected: selectIndex == SideBar.survey,
                    isDisplayed: false,
                    onTap: () => Get.offNamed("survey"),
                  ),
                  SizedBox(
                    height: 90.h,
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
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(0.5),
                            height: 1,
                          )),
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.facebook_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Icon(
                              Icons.email_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Icon(
                              Icons.tiktok_outlined,
                              size: 40,
                            ),
                          ],
                        ),
                      )
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
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 10.h),
        selected: isSelected,
        selectedTileColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
        leading: Icon(
          icon,
          size: 30,
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
