import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_containers/info_container.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/news/models/news_model.dart';
import 'package:mary_cruz_app/news/data/news_datasource.dart';

import '../../../core/ui/components/hearts_score.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // Lista de noticias que se llenará cuando las noticias sean obtenidas
  List<NewsModel> _news = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  // Función para obtener noticias desde el servicio
  Future<void> _fetchNews() async {
    try {
      final news = await NewsDataSource().getAllNews();
      setState(() {
        _news = news;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error al obtener noticias: $e');
    }
  }

  // Función para manejar la recarga
  Future<void> _refreshNews() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Noticias',
        ),
        drawer: const GlobalSidebar(
          selectedIndex: SideBar.news,
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator()) // Mostrar el Progress Bar
            : _news.isEmpty
                ? const Center(child: Text('No hay noticias disponibles'))
                : RefreshIndicator(
                    onRefresh: _refreshNews,
                    child: ListView.builder(
                      itemCount: _news.length,
                      itemBuilder: (context, index) {
                        final newsItem = _news[index];
                        return InfoContainer(
                            news: newsItem,
                            footer: HeartsScore(
                            ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
