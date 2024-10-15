

import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

import '../models/comment_model.dart';

class CommentsDataSource {


  Future<void> addComment({required CommentModel comment}) async{
    try{
      await supabase.from('opiniones').insert([comment.toJson()]);
      print('Comentario agregado correctamente');
    }catch(e){
      print('Error al agregar el comentario: $e');
      throw Exception('Error al agregar el comentario: $e');
    }
  }

}