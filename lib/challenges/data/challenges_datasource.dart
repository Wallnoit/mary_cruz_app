

import 'package:mary_cruz_app/challenges/models/challenge_model.dart';
import 'package:mary_cruz_app/news/models/news_model.dart';

import '../../core/models/user_model.dart';
import '../../core/supabase/supabase_instance.dart';

class ChallengesDataSource{

  Future<List<NewsModel>> getAllChallenges() async {
    try {
      final response = await supabase.from('retos').select();
      print('Response: $response');
      final List<NewsModel> news = response.map<NewsModel>((data) => NewsModel.fromJson(data)).toList();
      return news;
    } catch (e) {
      print('Error al obtener retos: $e');
      throw Exception('Error al obtener retos');
    }
  }

  Future<void> saveChallengeUser({required UserModel user, required ChallengeUserModel challenge})async {

  }


}