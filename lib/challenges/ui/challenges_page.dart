import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importa para inicializar la localización
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_containers/info_container.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/news/models/news_model.dart';
import 'package:mary_cruz_app/news/data/news_datasource.dart';

import '../../../core/ui/components/hearts_score.dart';
import '../data/challenges_datasource.dart';
import '../models/challenge_model.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  List<ChallengeModel> _challenges = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
    _fetchChallenges();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('es_ES', null);
  }

  Future<void> _fetchChallenges() async {
    try {
      final challenges = await ChallengesDataSource().getAllChallenges();
      setState(() {
        _challenges = challenges;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error al obtener retos: $e');
    }
  }

  Future<void> _refreshChallenges() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchChallenges();
  }

  Map<String, List<ChallengeModel>> _groupChallengesByDate(List<ChallengeModel> challenges) {
    Map<String, List<ChallengeModel>> groupedChallenges= {};
    for (var challengeItem in challenges) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(challengeItem.createdAt);
      if (!groupedChallenges.containsKey(formattedDate)) {
        groupedChallenges[formattedDate] = [];
      }
      groupedChallenges[formattedDate]?.add(challengeItem);
    }
    return groupedChallenges;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Retos',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.challenges,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _challenges.isEmpty
            ? const Center(child: Text('No hay retos nibles'))
            : RefreshIndicator(
          onRefresh: _refreshChallenges,
          child: _buildChallengesList(),
        ),
      ),
    );
  }

  Widget _buildChallengesList() {
    final groupedChallenges = _groupChallengesByDate(_challenges);
    final sortedKeys = groupedChallenges.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      itemCount: groupedChallenges.values.fold(0, (prev, element) => prev + element.length) + sortedKeys.length,
      itemBuilder: (context, index) {
        int newsIndex = 0;
        for (var date in sortedKeys) {
          if (index == newsIndex) {
            return _buildDateDivider(date);
          }
          newsIndex++;
          final newsList = groupedChallenges[date]!;
          if (index - newsIndex < newsList.length) {
            return InfoContainer(
              title: newsList[index - newsIndex].nombre,
              description: newsList[index - newsIndex].description,
              imageUrl: 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              imageHint:'',
              footer: SizedBox(
              ),
            );
          }
          newsIndex += newsList.length;
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDateDivider(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
                DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.parse(date)),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
