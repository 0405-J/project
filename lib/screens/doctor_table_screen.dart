import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/doctor.dart';
import '../widgets/doctor_data_source.dart';

class DoctorTableScreen extends StatefulWidget {
  @override
  _DoctorTableScreenState createState() => _DoctorTableScreenState();
}

class _DoctorTableScreenState extends State<DoctorTableScreen> {
  List<Doctor> doctors = [
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Smith',
        location: 'New York',
        specialty: 'Cardiology',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. ali',
        location: 'New York',
        specialty: 'desease',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. salah',
        location: 'California',
        specialty: 'Generaliste',
        phone: '123-456-7890',
        address: '123 Main St'),
    Doctor(
        name: 'Dr. Johnson',
        location: 'Los Angeles',
        specialty: 'Dermatology',
        phone: '234-567-8901',
        address: '456 Elm St'),
    // Add more doctors here
  ];

  late DoctorDataSource doctorDataSource;
  final int rowsPerPage = 5; // Number of rows per page

  @override
  void initState() {
    super.initState();
    doctorDataSource = DoctorDataSource(doctors);
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  double getColumnWidth(BuildContext context, String columnName) {
    if (isMobile(context)) {
      return columnName == 'name' ? 150 : 100; // Smaller widths for mobile
    } else {
      return columnName == 'name' ? 200 : 150; // Larger widths for tablets
    }
  }

  double getFontSize(BuildContext context) {
    return isMobile(context) ? 12 : 14; // Smaller font for mobile
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfDataGrid(
            source: doctorDataSource,
            columns: [
              GridColumn(
                columnName: 'name',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: getFontSize(context)),
                  ),
                ),
                width: getColumnWidth(context, 'name'),
              ),
              GridColumn(
                columnName: 'location',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location',
                    style: TextStyle(fontSize: getFontSize(context)),
                  ),
                ),
                width: getColumnWidth(context, 'location'),
                visible: !isMobile(context), // Hide on mobile
              ),
              GridColumn(
                columnName: 'specialty',
                label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Specialty',
                    style: TextStyle(fontSize: getFontSize(context)),
                  ),
                ),
                width: getColumnWidth(context, 'specialty'),
              ),
            ],
            allowSorting: true,
            allowFiltering: true,
          ),
        ),
        // Pagination Controls
        SfDataPager(
          delegate: doctorDataSource,
          pageCount: (doctors.length / rowsPerPage).ceil().toDouble(),
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
