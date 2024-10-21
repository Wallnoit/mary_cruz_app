
import 'package:mary_cruz_app/proposals/models/proposed_approach_model.dart';

import '../../core/supabase/supabase_instance.dart';

class ProposedApproachesDataSource{

  Future<List<ProposedApproachModel>> getAllProposedApproaches() async {
    try {
      final response = await supabase.from('enfoques_propuestas').select();
      print('Response: $response');
      final List<ProposedApproachModel> proposedApproaches = response.map<ProposedApproachModel>((data) => ProposedApproachModel.fromJson(data)).toList();
      return proposedApproaches;
    } catch (e) {
      print('Error al obtener enfoques propuestos: $e');
      throw Exception('Error al obtener enfoques propuestos');
    }

  }


}