import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../models/doctor.dart';

class DoctorTableScreen extends StatefulWidget {
  @override
  _DoctorTableScreenState createState() => _DoctorTableScreenState();
}

class _DoctorTableScreenState extends State<DoctorTableScreen> {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Martin',
      location: 'Lyon',
      specialty: 'Dermatologie',
      phone: '04 56 78 90 12',
      address: '456 Rue de Lyon',
    ),
    Doctor(
      name: 'Dr. jihed',
      location: 'Paris',
      specialty: 'dev',
      phone: '85889765',
      address: '123 Rue Ramla',
    ),
    Doctor(
      name: 'Dr. jihed',
      location: 'Paris',
      specialty: 'dev',
      phone: '51885304',
      address: '123 Rue Ramla',
    ),
    Doctor(
      name: 'Dr. Nidhal',
      location: 'Tunis',
      specialty: 'concepteur',
      phone: '01 23 45 67 00',
      address: '123 Rue de mahdia',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. ali',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '121 3 456 789',
      address: '123 Rue hiboun',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'lyon',
      specialty: 'ardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'brdiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. Dupont',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '5188444',
      address: '15 Rue de Paris',
    ),
    // Add more doctors here
  ];
  List<PlutoRow> createDoctorRows(List<Doctor> doctors) {
    return doctors.map((doctor) {
      return PlutoRow(
        key: ValueKey(doctor.id), // Use UUID as key
        cells: doctor.toCells(),
      );
    }).toList();
  }

  String? expandedRowIndex; // Store index of expanded row (null means none)

  late PlutoGridStateManager stateManager;
  Doctor? expandedDoctor;

  // Pagination controls
  final int defaultPageSize = 5;
  final List<int> pageSizeOptions = [10, 20, 50];
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = List.from(doctors); // Start with all doctors
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
                  if (value.isEmpty) {
                    filteredDoctors = List.from(doctors); // Reset to full list
                  } else {
                    List<String> searchTerms = value.toLowerCase().split(' ');
                    filteredDoctors = doctors.where((doctor) {
                      String rowData =
                          "${doctor.name} ${doctor.location} ${doctor.specialty} ${doctor.phone} ${doctor.address}"
                              .toLowerCase();
                      return searchTerms
                          .every((term) => rowData.contains(term));
                    }).toList();
                  }
                });
                stateManager.removeAllRows();
                List<PlutoRow> newRows = createDoctorRows(filteredDoctors);

                // Add new rows to the grid
                stateManager.appendRows(newRows);
                stateManager.notifyListeners();
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
              rows: createDoctorRows(filteredDoctors),
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;

                // Initialize pagination
                stateManager.setPageSize(5, notify: true);

                stateManager.addListener(() {
                  print(stateManager.page);
                  //if (stateManager.page > 1) {
                  //  stateManager.setPageSize(5, notify: true);
                });
              },
              onSelected: (PlutoGridOnSelectedEvent event) {
                final String tappedRowId = event.row!.cells['doctor']!.value
                    .id; // Assuming doctor has an 'id' field
                print("Right-clicked row: ${tappedRowId}");
                setState(() {
                  if (expandedRowIndex == tappedRowId) {
                    expandedRowIndex = null;
                    stateManager.setPageSize(5,
                        notify: true); // Retour à 5 éléments par page
                  } else {
                    expandedRowIndex = tappedRowId;
                    stateManager.setPageSize(6,
                        notify: true); // Augmenter à 6 éléments
                  }
                });

                // Clear existing rows
                stateManager.removeAllRows();

                // Generate new rows with updated expanded state
                List<PlutoRow> newRows = filteredDoctors
                    .map((doctor) {
                      bool isExpanded = expandedRowIndex == doctor.id;

                      PlutoRow mainRow = PlutoRow(
                        key: ValueKey(
                            doctor.id), // Ensure PlutoRow has a unique key
                        cells: {
                          'name': PlutoCell(value: doctor.name),
                          'location': PlutoCell(value: doctor.location),
                          'specialty': PlutoCell(value: doctor.specialty),
                          'actions': PlutoCell(value: doctor.id),
                          'doctor': PlutoCell(value: doctor),
                        },
                      );

                      if (isExpanded) {
                        // Insert expanded details row right after main row
                        return [
                          mainRow,
                          PlutoRow(
                            key: ValueKey(
                                '${doctor.id}_details'), // Unique key for details row
                            cells: {
                              'name': PlutoCell(
                                  value: '📍 Adresse: ${doctor.address}'),
                              'location':
                                  PlutoCell(value: '📞 Tel: ${doctor.phone}'),
                              'specialty': PlutoCell(value: ''),
                              'actions': PlutoCell(value: ''),
                              'doctor': PlutoCell(value: doctor),
                            },
                          )
                        ];
                      } else {
                        return [mainRow];
                      }
                    })
                    .expand((rowList) => rowList)
                    .toList();

                // Add new rows to PlutoGrid
                stateManager.appendRows(newRows);
                stateManager.notifyListeners();
              },
              configuration: PlutoGridConfiguration(
                localeText: const PlutoGridLocaleText.french(),
                style: PlutoGridStyleConfig(
                  enableRowColorAnimation: true,
                  activatedColor: Color.fromARGB(255, 171, 227, 245),
                  gridBorderColor: Color.fromARGB(255, 223, 222, 222),
                  rowColor: Colors.white,
                  checkedColor: Color.fromARGB(255, 37, 232, 34),
                ),
              ),
              createFooter: (stateManager) {
                expandedRowIndex = null;
                stateManager.setPageSize(5, notify: false);
                print('check page number${stateManager.page}');

                stateManager.setPage(0, notify: true); // Start at page 0

                return PlutoPagination(stateManager, pageSizeToMove: 1);
              },
            ),
          ),
          // Pagination Controls

          // Collapsible Section (unchanged)
          if (expandedDoctor != null)
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Détails supplémentaires:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Téléphone: ${expandedDoctor!.phone}'),
                  Text('Adresse: ${expandedDoctor!.address}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
