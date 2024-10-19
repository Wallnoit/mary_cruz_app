import 'package:flutter/material.dart';
import 'package:mary_cruz_app/candidates/ui/widgets/candidate_card.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';

class CandidatesPage extends StatefulWidget {
  const CandidatesPage({super.key});

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Candidatos',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.candidates,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: const Center(
            child: Column(
              children: [
                CandidateCard(),
                const SizedBox(height: 20),
                CandidateCard(),
                const SizedBox(height: 20),
                CandidateCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
