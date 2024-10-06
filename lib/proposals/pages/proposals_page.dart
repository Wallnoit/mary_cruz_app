import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';

class ProposalsPage extends StatefulWidget {
  const ProposalsPage({super.key});

  @override
  State<ProposalsPage> createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppbar(
          title: 'Propuestas',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.proposals,
        ),
        body: const Center(
          child: Text('Proposals Page'),
        ),
      ),
    );
  }
}
