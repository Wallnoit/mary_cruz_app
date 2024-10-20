

import 'package:mary_cruz_app/news/models/news_model.dart';

import '../../core/supabase/supabase_instance.dart';

class NewsDataSource{

  Future<List<NewsModel>> getAllNews() async {
    try {
      final response = await supabase.from('noticias').select();
      print('Response: $response');
      final List<NewsModel> news = response.map<NewsModel>((data) => NewsModel.fromJson(data)).toList();
      return news;
    } catch (e) {
      print('Error al obtener noticias: $e');
      throw Exception('Error al obtener noticias');
    }
  }


}