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

  List<FacultyModel> getFacultades() {
    return facultades;
  }

   String getFacultadesString() {
    String valFacu = "";
    for(FacultyModel facu in facultades){
      valFacu +=" "+facu.siglas;
    }
    return valFacu;
  }


  List<ProposedApproachModel> getEnfoques() {
    return enfoques;
  }


   String getEnfoquesString() {
    String valEnfoque = "";
    for(ProposedApproachModel enfo in enfoques){
      valEnfoque +=" "+enfo.titulo;
    }
    return valEnfoque;

   }


   bool hasInfo(){
    return (facultades.length + enfoques.length) >0 ? true : false;
   }

    void eraseInfo(){
      facultades.clear();
      enfoques.clear();
   }
    

}
