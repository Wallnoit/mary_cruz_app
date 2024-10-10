import 'package:get/get.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class ConfigController extends GetxController {
  var currentSurvey = "".obs;

  getCurrentSurvey() async {
    try {
      final data = await supabase
          .from('configuraciones')
          .select()
          .eq('key', 'currentSurvey')
          .single();

      print(data);

      currentSurvey.value = data['value'];
    } catch (e) {
      print("Error al obtener las opciones del menú $e");
      currentSurvey.value = "";
    }
  }
}
