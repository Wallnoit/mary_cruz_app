

import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';
import '../../core/errors/failures.dart';
import '../models/user_model.dart';

class UsersDataSource {


  Future<void> addUser({required UserAndCommentModel user}) async{
    print('Agregando datos de usuario');
    try{
      await supabase.rpc('insert_opinion_and_user',params: user.toJson());
      //await supabase.from('usuarios').insert([user.toJson()]);
      print('Datos de usuario agregados correctamente');
    }catch(e){
      print(e);
      throw ServerFailure(errorMessage: 'Error en servidor al agregar datos de el usuario');
    }
  }

}