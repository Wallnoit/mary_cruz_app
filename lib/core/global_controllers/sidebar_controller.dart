import 'package:get/get.dart';
import 'package:mary_cruz_app/core/entities/sidebar_option.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class SidebarController extends GetxController {
  var listSidebarOptions = [].obs;

  getSidebarOptions() async {
    try {
      final data = await supabase
          .from('opciones_menu')
          .select()
          .order('orden', ascending: true);

      final List<SidebarOptions> sidebarOptions =
          data.map((e) => SidebarOptions.fromMap(e)).toList();

      listSidebarOptions.value = sidebarOptions;
    } catch (e) {
      print("Error al obtener las opciones del menú $e");
      listSidebarOptions.value = [];
    }
  }
}
