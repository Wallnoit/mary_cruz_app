import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';

class TestimonyPage extends StatefulWidget {
  const TestimonyPage({super.key});

  @override
  State<TestimonyPage> createState() => _TestimonyPageState();
}

class _TestimonyPageState extends State<TestimonyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Testimonios',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.testimony,
        ),
        body: const Center(
          child: Text('Testimony Page'),
        ),
      ),
    );
  }
}
