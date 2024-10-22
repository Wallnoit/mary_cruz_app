

import 'package:supabase_flutter/supabase_flutter.dart';

import '../errors/failures.dart';
import '../models/vote_model.dart';
import '../supabase/supabase_instance.dart';

class VotesDataSource {

  Future<void> saveNewsVote({required VoteNewsModel voteNews })async {
    try{
      final response = await supabase.from('votos_noticias').insert(voteNews.toJson());
    }catch(e){
      if(e is PostgrestException){
        if(e.code == 'P0001'){
          throw DuplicateFailure(errorMessage: e.message);
        }
      }
      throw ServerFailure(errorMessage: 'Error en servidor al guardar voto de noticia');
    }
  }

  Future<void> saveProposalVote({required VoteProposalModel voteProposals })async {
    try{
      final response = await supabase.from('votos_propuestas').insert(voteProposals.toJson());
    }catch(e){
      if(e is PostgrestException){
        if(e.code == 'P0001'){
          throw DuplicateFailure(errorMessage: e.message);
        }
      }
      throw ServerFailure(errorMessage: 'Error en servidor al guardar voto de propuesta');
    }
  }

}