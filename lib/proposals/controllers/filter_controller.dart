import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/models/faculties_model.dart';
import '../models/proposed_approach_model.dart';

class FilterController extends GetxController {
  List<FacultyModel> _facultades = [];
  List<ProposedApproachModel> _enfoques = [];

  List<FacultyModel> _selectedFacultades = [];
  List<ProposedApproachModel> _selectedEnfoques = [];

  List<FacultyModel> get facultades => _facultades;
  List<ProposedApproachModel> get enfoques => _enfoques;

  List<FacultyModel> get selectedFacultades => _selectedFacultades;
  List<ProposedApproachModel> get selectedEnfoques => _selectedEnfoques;

  void setFacultades(List<FacultyModel> facultades) {
    _facultades = facultades;
    update();
  }

  void setEnfoques(List<ProposedApproachModel> enfoques) {
    _enfoques = enfoques;
    update();
  }

  void toggleFacultySelection(FacultyModel facultad) {
    if (_selectedFacultades.contains(facultad)) {
      _selectedFacultades.remove(facultad);
    } else {
      _selectedFacultades.add(facultad);
    }
    update();
  }

  void toggleEnfoqueSelection(ProposedApproachModel enfoque) {
    if (_selectedEnfoques.contains(enfoque)) {
      _selectedEnfoques.remove(enfoque);
    } else {
      _selectedEnfoques.add(enfoque);
    }
    update();
  }

  void clearSelections() {
    _selectedFacultades.clear();
    _selectedEnfoques.clear();
    update(); 
  }
}
