import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_containers/info_container.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/proposals/models/proposal_model.dart';

import '../../../core/ui/components/hearts_score.dart';
import '../../data/proposals_datasource.dart';

class ProposalsPage extends StatefulWidget {
  const ProposalsPage({super.key});

  @override
  State<ProposalsPage> createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  List<ProposalModel> _proposals = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProposals();
  }

  Future<void> _fetchProposals() async {
    try {
      final proposals = await ProposalsDataSource().getPropuestas();

      setState(() {
        _proposals = proposals;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error al obtener propuestas: $e');
    }
  }

  Future<void> _refreshProposals() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchProposals();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Propuestas',
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshProposals,
            ),
          ],
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.proposals,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _proposals.isEmpty
            ? const Center(child: Text('No hay propuestas disponibles'))
            : RefreshIndicator(
          onRefresh: _refreshProposals,
          child: _buildProposalsList(),
        ),
      ),
    );
  }

  Widget _buildProposalsList() {
    return ListView.builder(
      itemCount: _proposals.length,
      itemBuilder: (context, index) {
        final proposalItem = _proposals[index];
        return InfoContainer(
          title: proposalItem.titulo,
          description: proposalItem.descripcion,
          imageUrl: proposalItem.imageUrl,
          imageHint: proposalItem.descripcion,
          footer: HeartsScore(),
        );
      },
    );
  }
}
