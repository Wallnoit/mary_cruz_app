import 'package:get/get.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';
import 'package:mary_cruz_app/core/utils/cellphone_info.dart';

class ConfigController extends GetxController {
  var currentSurvey = "".obs;
  var isCompletedSurvey = false.obs;
  var currentVersion = "".obs;

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
      print("Error al obtener la encuesta $e");
      currentSurvey.value = "";
    }
  }

  isCompletedSurveyF() async {
    try {
      var deviceId = await getDeviceId();
      final data = await supabase.rpc('verificar_usuario_y_encuesta', params: {
        'dispositivo_id': deviceId,
        'encuesta_id': currentSurvey.value
      });

      print(data);

      isCompletedSurvey.value = data;
    } catch (e) {
      print("Error al obtener las opciones del menú $e");
      currentSurvey.value = "";
    }
  }

  getCurrentVersion() async {
    try {
      var data = await supabase
          .from('configuraciones')
          .select()
          .eq('key', 'currentVersion')
          .single();

      currentVersion.value = data['value'];
    } catch (e) {
      print("Error al obtener la version $e");
      currentVersion.value = '';
    }
  }
}
