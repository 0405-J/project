import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../models/doctor.dart';
import '../utils/screen_utils.dart';

class DoctorDataSource extends DataGridSource {
  List<Doctor> doctors;
  List<DataGridRow> _rows = [];
  bool isExpanded = false;

  DoctorDataSource(this.doctors) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _rows = doctors.map<DataGridRow>((doctor) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'name', value: doctor.name),
        DataGridCell<String>(columnName: 'location', value: doctor.location),
        DataGridCell<String>(columnName: 'specialty', value: doctor.specialty),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _rows.indexOf(row);
    final Doctor doctor = doctors[rowIndex];

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
          child: Text(
            dataGridCell.value.toString(),
            style: TextStyle(
                fontSize:
                    ScreenUtils.getFontSize(null)), // Responsive font size
          ),
        );
      }).toList(),
    );
  }
}
