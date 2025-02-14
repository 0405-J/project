import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../models/doctor.dart';
import '../utils/constants.dart';

class DoctorService {
  /// List of doctors: statique
  static final List<Doctor> doctors = [
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
      name: 'Dr. jihedd',
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
      name: 'Dr. ahmed',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. ska',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. mourad',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. mohamed',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. jacer',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. oussma',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. khalil',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. monji',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. sassi',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. mounir',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. bassem',
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
      name: 'Dr. mondher',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. maher',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. fahd',
      location: 'lyon',
      specialty: 'ardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. kacem',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. bilel',
      location: 'Paris',
      specialty: 'brdiologie',
      phone: '01 23 45 67 89',
      address: '123 Rue de Paris',
    ),
    Doctor(
      name: 'Dr. francois',
      location: 'Paris',
      specialty: 'Cardiologie',
      phone: '5188444',
      address: '15 Rue de Paris',
    ),
    // Add more doctors here
  ];

  /// Create list of [PlutoRow] from list of doctors
  static List<PlutoRow> createDoctorRows(List<Doctor> doctors) {
    return doctors.map((doctor) {
      return PlutoRow(
        key: ValueKey(doctor.id),
        cells: doctor.toCells(),
      );
    }).toList();
  }

  /// Filter doctors with serach query
  static List<Doctor> filterDoctors(List<Doctor> doctors, String query) {
    if (query.isEmpty) return List.from(doctors);
    List<String> searchTerms = query.toLowerCase().split(' ');

    return doctors.where((doctor) {
      String rowData =
          "${doctor.name} ${doctor.location} ${doctor.specialty} ${doctor.phone} ${doctor.address}"
              .toLowerCase();
      return searchTerms.every((term) => rowData.contains(term));
    }).toList();
  }

  // Function to handle row expansion logic
  static List<PlutoRow> handleRowExpansion(String? expandedRowIndex,
      PlutoGridStateManager stateManager, List<Doctor> filteredDoctors) {
    List<PlutoRow> newRows = filteredDoctors
        .map((doctor) {
          bool isExpanded = expandedRowIndex == doctor.id;

          PlutoRow mainRow = PlutoRow(
            key: ValueKey(doctor.id),
            cells: {
              'name': PlutoCell(value: doctor.name),
              'location': PlutoCell(value: doctor.location),
              'specialty': PlutoCell(value: doctor.specialty),
              'actions': PlutoCell(value: doctor.id),
              'doctor': PlutoCell(value: doctor),
            },
          );

          if (isExpanded) {
            return [
              mainRow,
              PlutoRow(
                key: ValueKey('${doctor.id}_details'),
                cells: {
                  'name': PlutoCell(value: '📍 Adresse: ${doctor.address}'),
                  'location': PlutoCell(value: '📞 Tel: ${doctor.phone}'),
                  'specialty': PlutoCell(value: ''),
                  'actions': PlutoCell(value: ''),
                  'doctor': PlutoCell(value: doctor),
                  'expanded': PlutoCell(value: true)
                },
              )
            ];
          } else {
            return [mainRow];
          }
        })
        .expand((rowList) => rowList)
        .toList();

    return newRows;
  }

  //logic for selection a row
  static void handleRowSelection(
    String? expandedRowIndex,
    Function(String?) updateExpandedRowIndex,
    PlutoGridStateManager stateManager,
    int selectedRowIndex,
    PlutoGridOnSelectedEvent event,
    List<Doctor> filteredDoctors,
  ) {
    PlutoCell? expandedCell = event.row!.cells['expanded'];
    final tappedRowId =
        event.row!.cells['doctor']!.value.id; // Assuming doctor has 'id' field
    bool isExpanded = expandedCell?.value ?? false;
    String? newExpandedRowIndex;
    if (expandedRowIndex == tappedRowId) {
      newExpandedRowIndex = null;
      stateManager.setPageSize(defaultPageSize, notify: true);
    } else {
      if (selectedRowIndex == defaultPageSize - 1 && !isExpanded) {
        newExpandedRowIndex = tappedRowId;
        stateManager.setPageSize(defaultPageSize + 1, notify: true);
      } else {
        newExpandedRowIndex = tappedRowId;
        stateManager.setPageSize(defaultPageSize, notify: true);
      }
    }
    updateExpandedRowIndex(newExpandedRowIndex);
    // Handle row expansion logic
    List<PlutoRow> newRows = handleRowExpansion(
      newExpandedRowIndex,
      stateManager,
      filteredDoctors,
    );
    refreshGrid(newRows, stateManager, filteredDoctors);
  }

  // Method to refresh the grid based on the filtered list
  static void refreshGrid(List<PlutoRow> newRows,
      PlutoGridStateManager stateManager, List<Doctor> filteredDoctors) {
    stateManager.removeAllRows();
    stateManager.appendRows(newRows);
    stateManager.notifyListeners();
  }
}
