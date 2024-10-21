
import 'package:mary_cruz_app/core/models/faculties_model.dart';

import '../supabase/supabase_instance.dart';

class FacultiesDataSource{


  Future<List<FacultyModel>> getAllFaculties() async {
    try {
      final response = await supabase.from('facultades_departamentos').select();
      print('Response: $response');
      final List<FacultyModel> faculties = response.map<FacultyModel>((data) => FacultyModel.fromJson(data)).toList();
      return faculties;
    } catch (e) {
      print('Error al obtener facultades: $e');
      throw Exception('Error al obtener facultades');
    }

  }

}