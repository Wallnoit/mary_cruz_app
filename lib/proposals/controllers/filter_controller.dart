import 'package:get/get.dart';
import '../../core/models/faculties_model.dart';
import '../models/proposed_approach_model.dart';

class FilterController extends GetxController {
  var facultades = <FacultyModel>[].obs;
  var enfoques = <ProposedApproachModel>[].obs;

  void setFacultades(List<FacultyModel> newFacultades) {
    facultades.assignAll(newFacultades);
  }

  void setEnfoques(List<ProposedApproachModel> newEnfoques) {
    enfoques.assignAll(newEnfoques);

    void addFaculty(FacultyModel faculty) {
      facultades.add(faculty);
    }

    void addEnfoque(ProposedApproachModel enfoque) {
      enfoques.add(enfoque);
    }
  }
}
