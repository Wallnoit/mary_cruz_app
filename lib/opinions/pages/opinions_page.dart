import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';

class OpinionsPage extends StatefulWidget {
  const OpinionsPage({super.key});

  @override
  State<OpinionsPage> createState() => _OpinionsPageState();
}

class _OpinionsPageState extends State<OpinionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppbar(
          title: 'Opiniones',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.opinions,
        ),
        body: const Center(
          child: Text('Opinions Page'),
        ),
      ),
    );
  }
}
