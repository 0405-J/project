import 'package:pluto_grid/pluto_grid.dart';
import 'package:uuid/uuid.dart';

class Doctor {
  final String id;
  final String name;
  final String location;
  final String specialty;
  final String phone;
  final String address;

  Doctor({
    required this.name,
    required this.location,
    required this.specialty,
    required this.phone,
    required this.address,
  }) : id = const Uuid().v4();
  Map<String, PlutoCell> toCells() => {
        'id': PlutoCell(value: id), // Unique identifier
        'name': PlutoCell(value: name),
        'location': PlutoCell(value: location),
        'specialty': PlutoCell(value: specialty),
        'actions': PlutoCell(value: id),
        'doctor': PlutoCell(value: this), // Store full object
      };
}
