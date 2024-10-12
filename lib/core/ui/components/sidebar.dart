import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/global_controllers/sidebar_controller.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';
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
  SidebarController controller = Get.find();

  get selectIndex => widget.selectedIndex;

  bool membershipOptions = false;
  bool paymentsOptions = false;

  getOptionMenu() async {
    final data = await supabase
        .from('opciones_menu')
        .select()
        .order('orden', ascending: true);

    print(data);
  }

  SideBar? selected;

  @override
  void initState() {
    super.initState();
    // Código de inicialización
    print("Widget inicializado");
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: Obx(() {
        return Drawer(
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
                      title: controller.listSidebarOptions[0].title ?? '',
                      icon: Icons.home_outlined,
                      isSelected: selectIndex == SideBar.home,
                      isVisible: controller.listSidebarOptions[0].isVisible,
                      onTap: () => Get.offNamed("/"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[1].title ?? '',
                      icon: Icons.people_alt_outlined,
                      isSelected: selectIndex == SideBar.candidates,
                      isVisible: controller.listSidebarOptions[1].isVisible,
                      onTap: () => Get.offNamed("candidates"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[2].title ?? '',
                      icon: Icons.assignment_outlined,
                      isSelected: selectIndex == SideBar.proposals,
                      isVisible: false,
                      onTap: () => Get.offNamed("proposals"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[3].title ?? '',
                      icon: Icons.newspaper_outlined,
                      isSelected: selectIndex == SideBar.news,
                      isVisible: controller.listSidebarOptions[3].isVisible,
                      onTap: () => Get.offNamed("news"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[4].title ?? '',
                      icon: Icons.event_outlined,
                      isSelected: selectIndex == SideBar.events,
                      isVisible: controller.listSidebarOptions[4].isVisible,
                      onTap: () => Get.offNamed("events"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[5].title ?? '',
                      icon: Icons.star_border_outlined,
                      isSelected: selectIndex == SideBar.testimony,
                      isVisible: controller.listSidebarOptions[5].isVisible,
                      onTap: () => Get.offNamed("testimony"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[6].title ?? '',
                      icon: Icons.chat_outlined,
                      isSelected: selectIndex == SideBar.opinions,
                      isVisible: controller.listSidebarOptions[6].isVisible,
                      onTap: () => Get.offNamed("opinions"),
                    ),
                    RowSidebar(
                      title: controller.listSidebarOptions[7].title ?? '',
                      icon: Icons.poll_outlined,
                      isSelected: selectIndex == SideBar.survey,
                      isVisible: controller.listSidebarOptions[7].isVisible,
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
        );
      }),
    );
  }
}

class RowSidebar extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isVisible;
  final Function()? onTap;

  const RowSidebar({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
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
      ),
    );
  }
}
