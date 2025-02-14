import 'package:BioTrack/services/doctor_service.dart';
import 'package:BioTrack/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../models/doctor.dart';

class DoctorTableScreen extends StatefulWidget {
  @override
  _DoctorTableScreenState createState() => _DoctorTableScreenState();
}

class _DoctorTableScreenState extends State<DoctorTableScreen> {
  String? expandedRowIndex;
  int previousPage = 1;
  late PlutoGridStateManager stateManager;

  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors =
        List.from(DoctorService.doctors); // Start with all doctors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau des Médecins'),
      ),
      body: Column(
        children: [
          // Search Bar (unchanged)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filteredDoctors =
                      DoctorService.filterDoctors(DoctorService.doctors, value);
                });
                List<PlutoRow> newRows =
                    DoctorService.createDoctorRows(filteredDoctors);
                DoctorService.refreshGrid(
                    newRows, stateManager, filteredDoctors);
              },
            ),
          ),
          // PlutoGrid Table
          Expanded(
            child: PlutoGrid(
              mode: PlutoGridMode.selectWithOneTap,
              columns: [
                PlutoColumn(
                  title: 'Nom',
                  field: 'name',
                  type: PlutoColumnType.text(),
                ),
                PlutoColumn(
                  title: 'Localisation',
                  field: 'location',
                  type: PlutoColumnType.text(),
                ),
                PlutoColumn(
                  title: 'Spécialité',
                  field: 'specialty',
                  type: PlutoColumnType.text(),
                ),
                PlutoColumn(
                  title: 'Actions',
                  field: 'actions',
                  type: PlutoColumnType.text(),
                  renderer: (rendererContext) {
                    final hasActions =
                        (rendererContext.cell.value as String).isNotEmpty;

                    if (hasActions) {
                      return Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.visibility, color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
              rows: DoctorService.createDoctorRows(filteredDoctors),
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;

                stateManager.addListener(() {
                  if (previousPage != stateManager.page) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        previousPage = stateManager.page;

                        stateManager.setPageSize(defaultPageSize, notify: true);

                        expandedRowIndex = null;

                        List<PlutoRow> newRows =
                            DoctorService.createDoctorRows(filteredDoctors);
                        DoctorService.refreshGrid(
                            newRows, stateManager, filteredDoctors);
                      });
                    });
                  }
                });
              },
              onSelected: (PlutoGridOnSelectedEvent event) {
                int selectedRowIndex = stateManager.refRows.indexOf(event.row!);
                DoctorService.handleRowSelection(
                  expandedRowIndex,
                  (String? newExpandedRowIndex) {
                    setState(() {
                      expandedRowIndex = newExpandedRowIndex;
                    });
                  },
                  stateManager,
                  selectedRowIndex,
                  event,
                  filteredDoctors,
                );
              },
              configuration: PlutoGridConfiguration(
                localeText: const PlutoGridLocaleText.french(),
                style: PlutoGridStyleConfig(
                  enableRowColorAnimation: true,
                  activatedColor: activatedRowColor,
                  gridBorderColor: gridBorderColor,
                  rowColor: rowColor,
                  checkedColor: checkedColor,
                ),
              ),
              createFooter: (stateManager) {
                expandedRowIndex = null;
                stateManager.setPageSize(defaultPageSize, notify: false);

                stateManager.setPage(0, notify: true); // Start at page 0

                return PlutoPagination(stateManager, pageSizeToMove: 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
