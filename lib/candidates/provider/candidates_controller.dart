import 'package:get/get.dart';
import 'package:mary_cruz_app/core/models/candidates_model.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class CandidatesController extends GetxController {
  var candidates = <CandidatesModel>[].obs;
  var candidate = CandidatesModel(
    id: '',
    name: '',
    phrase: '',
    role: '',
    image: '',
    urlVideo: '',
    facebook: '',
    instagram: '',
    tiktok: '',
    academicFormation: [],
    workExperience: [],
    investigations: [],
  ).obs;

  var error = false.obs;

  var isLoading = false.obs;

  getCandidates() async {
    isLoading.value = true;
    try {
      final data = await supabase.rpc('obtener_candidatos_con_datos');

      print(data);

      final List<CandidatesModel> candidatesList = data
          .map((e) {
            print(e['url_video']);
            return CandidatesModel.fromJson(e as Map<String, dynamic>);
          })
          .toList()
          .cast<CandidatesModel>();

      candidates.value = candidatesList;

      isLoading.value = false;
    } catch (e) {
      print("Error al obtener los candidatos $e");
      candidates.value = [];
      isLoading.value = false;
      error.value = true;
    }
  }

  setCandidate(CandidatesModel candidateReturned) {
    candidate.value = candidateReturned;
  }
}
