import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/data/faculties_datasource.dart';
import '../../../core/models/faculties_model.dart';
import '../../../proposals/models/proposed_approach_model.dart';
import '../../controllers/filter_controller.dart';
import '../../data/proposed_approach_datasource.dart';

class FilterDialog extends StatefulWidget {

  final List<FacultyModel>? facultadesGeneral;
  final List<ProposedApproachModel>? enfoquesGeneral;

  FilterDialog({
    Key? key,
    this.facultadesGeneral,
    this.enfoquesGeneral,
  }) : super(key: key);
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<FacultyModel> _facultades = [];
  List<ProposedApproachModel> _enfoques = [];
  List<FacultyModel> _selectedFacultades = [];
  List<ProposedApproachModel> _selectedEnfoques = [];
  bool _isLoading = true;

  bool _showAllFacultades = false;
  bool _showAllEnfoques = false;

  @override
  void initState() {
    super.initState();
    _fetchData(); 
  }

  Future<void> _fetchData() async {
    try {
      final faculties = await FacultiesDataSource().getAllFaculties();
      final approaches =
      await ProposedApproachesDataSource().getAllProposedApproaches();

      setState(() {
        _facultades = faculties;
        _enfoques = approaches;
        _isLoading = false;
      });


      _selectedFacultades = widget.facultadesGeneral!;
      _selectedEnfoques = widget.enfoquesGeneral!;

     
    } catch (e) {
      print('Error al obtener datos: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filtrar',
                  style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const Divider(),
          Center(
            child: Text('Facultades',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._facultades
                      .take(_showAllFacultades ? _facultades.length : 5)
                      .map((facultad) => CheckboxListTile(
                    title: Text(facultad.siglas,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                    value: _selectedFacultades.where((e) => e.siglas == facultad.siglas).toList().isNotEmpty ? true: false, 
                    onChanged: (bool? value) {
                      if (_selectedFacultades.where((e) => e.siglas == facultad.siglas).toList().isEmpty) {
                          _selectedFacultades.add(facultad);
                        } else {
                          //_selectedFacultades.remove(facultad);

                          _selectedFacultades.removeWhere((e) => e.siglas == facultad.siglas);
                          print(facultad.siglas);
                        }

                      setState(() {
                        _selectedFacultades;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                  )),
                  if (_facultades.length > 5)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showAllFacultades = !_showAllFacultades;
                        });
                      },
                      child: Text(_showAllFacultades ? 'Ver menos' : 'Ver más'),
                    ),
                  const Divider(),
                  Text('Enfoques',
                      style: Theme.of(context).textTheme.titleMedium),
                  ..._enfoques
                      .take(_showAllEnfoques ? _enfoques.length : 5)
                      .map((enfoque) => CheckboxListTile(
                    title: Text(enfoque.titulo,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                    value: _selectedEnfoques.contains(enfoque),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedEnfoques.add(enfoque);
                        } else {
                          _selectedEnfoques.remove(enfoque);
                        }
                      });
                    },
                    activeColor:
                    Theme.of(context).colorScheme.secondary,
                  )),
                  if (_enfoques.length > 5)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showAllEnfoques = !_showAllEnfoques;
                        });
                      },
                      child: Text(_showAllEnfoques ? 'Ver menos' : 'Ver más'),
                    ),
                ],
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      //final filterController = Get.put(FilterController());
                      print("_selectedFacultades "+ _selectedFacultades.toString());
                      //filterController.setFacultades(_selectedFacultades);
                      //filterController.setEnfoques(_selectedEnfoques);
                      //print('Facultades seleccionadas: ${filterController.facultades}');
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'FILTRAR',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
