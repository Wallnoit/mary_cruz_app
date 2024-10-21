import 'package:get/get.dart';
import 'package:mary_cruz_app/core/models/faculties_model.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class FacultiesController extends GetxController {
  var faculties = <FacultyModel>[].obs;

  getFaculties() async {
    try {
      final data = await supabase.from('facultades_departamentos').select();

      print(data);

      final List<FacultyModel> facultiesList = data
          .map((e) {
            return FacultyModel.fromMap(e as Map<String, dynamic>);
          })
          .toList()
          .cast<FacultyModel>();

      faculties.value = facultiesList;
    } catch (e) {}
  }
}
