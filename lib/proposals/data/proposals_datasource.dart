

import 'package:mary_cruz_app/proposals/models/proposal_model.dart';

import '../../core/supabase/supabase_instance.dart';

class ProposalsDataSource {

  Future<List<ProposalModel>> getPropuestas() async {
    try{
      final response = await supabase.rpc('get_propuestas_con_facultades_y_enfoques');
      print(response[0]);
      final List<ProposalModel> proposals = (response as List).map((e) => ProposalModel.fromJson(e)).toList();
      print(proposals[0].toJson());
      return proposals;
    }catch(e){
      print('Error al obtener propuestas: $e');
      throw e;
    }
  }

}