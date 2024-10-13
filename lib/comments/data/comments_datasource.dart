

import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../models/comment_model.dart';

class CommentsDataSource {


  Future<void> addComment({required CommentModel comment}) async{
    try{
      await supabase.from('opiniones').insert([comment.toJson()]);
    }catch(e){
      print(e);
      throw ServerFailure(errorMessage: 'Error en servidor al agregar comentario');
    }
  }

}