

import 'package:get/get_common/get_reset.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';
import '../../core/errors/failures.dart';
import '../models/user_model.dart';

class UsersDataSource {


  Future<void> addUser({required UserAndCommentModel user}) async{
    print('Agregando datos de usuario');
    try{
      await supabase.rpc('insert_opinion_and_user',params: user.toJsonRpc());
      //await supabase.from('usuarios').insert([user.toJson()]);
      print('Datos de usuario agregados correctamente');
    }catch(e){
      print(e);
      throw ServerFailure(errorMessage: 'Error en servidor al agregar datos de el usuario');
    }
  }

  Future<void> updateUser({required UserModel user}) async{
    print('Actualizando datos de usuario');
    print(user.email);
    try{
      final response =await supabase.from('usuarios').update({
        'email': user.email,
      }).eq('id', user.id!);
      print(response);
      print('Datos de usuario actualizados correctamente');
    }catch(e){
      print(e);
      throw ServerFailure(errorMessage: 'Error en servidor al actualizar datos de el usuario');
    }
  }

  Future<UserModel> getUserData({required String idDispositivo}) async {
    print('Obteniendo datos de usuario');
    try {
      final response = await supabase
          .from('usuarios')
          .select()
          .eq('id_dispositivo', idDispositivo)
          .filter('facultad', 'not.is', null);
      print('esta es la response');
      print(response);
      if (response == null || response.isEmpty) {
        print('No se encontraron datos para el usuario con el id_dispositivo proporcionado');
        throw NotFoundFailure(errorMessage: 'Usuario no encontrado');
      }
      print('Datos de usuario obtenidos correctamente');
      return UserModel.fromJson(response.first);
    } catch (e) {
      if (e is NotFoundFailure) {
        print(e.errorMessage);
        throw e;
      } else {
        print(e);
        throw ServerFailure(errorMessage: 'Error en servidor al obtener datos del usuario');
      }
    }
  }


}