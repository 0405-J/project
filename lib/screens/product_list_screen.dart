import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../models/doctor.dart';
import '../services/doctor_service.dart';
import '../utils/constants.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String? expandedRowIndex;
  int previousPage = 1;
  late PlutoGridStateManager stateManager;
  List<Doctor> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctors = List.from(DoctorService.doctors);
    searchController.addListener(performSearch);
  }

  void performSearch() {
    setState(() {
      filteredDoctors = DoctorService.filterDoctors(
          DoctorService.doctors, searchController.text);
    });
    List<PlutoRow> newRows = DoctorService.createDoctorRows(filteredDoctors);
    DoctorService.refreshGrid(newRows, stateManager, filteredDoctors);
  }

  void handleRowSelection(PlutoGridOnSelectedEvent event) {
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
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Text(
              'Liste des Produits',
              style: TextStyle(
                color: Colors.black87, fontSize: 22, // Taille du texte
                fontWeight: FontWeight.bold, // Gras pour le titre))),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SizedBox(
                width: screenWidth * 0.5,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hoverColor: AppColors.primaryColor,
                    hintText: 'Rechercher...',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
                    suffixIcon: GestureDetector(
                      onTap: performSearch,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child:
                            Icon(Icons.search, color: Colors.white, size: 24),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: AppColors.hoverColor, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: PlutoGrid(
                    mode: PlutoGridMode.normal,
                    columns: [
                      PlutoColumn(
                        title: 'Nom',
                        field: 'name',
                        type: PlutoColumnType.text(),
                        width: screenWidth * 0.25,
                        minWidth: 80,
                      ),
                      PlutoColumn(
                        title: 'Localisation',
                        field: 'location',
                        type: PlutoColumnType.text(),
                        width: screenWidth * 0.25,
                        minWidth: 100,
                      ),
                      PlutoColumn(
                        title: 'Spécialité',
                        field: 'specialty',
                        type: PlutoColumnType.text(),
                        width: screenWidth * 0.25,
                        minWidth: 80,
                      ),
                      PlutoColumn(
                        title: 'Actions',
                        field: 'actions',
                        type: PlutoColumnType.text(),
                        width: screenWidth * 0.15,
                        minWidth: 60,
                        renderer: (rendererContext) {
                          final int rowIndex = rendererContext.rowIdx;
                          final PlutoRow row = rendererContext.row;
                          final hasActions =
                              (rendererContext.cell.value as String).isNotEmpty;
                          if (hasActions) {
                            return Container(
                              constraints: BoxConstraints(maxWidth: 100),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 2, // Space between buttons
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.info_outline,
                                        color: Colors.orange, size: 22),
                                    onPressed: () {
                                      PlutoGridOnSelectedEvent event =
                                          PlutoGridOnSelectedEvent(
                                              rowIdx: rowIndex, row: row);
                                      handleRowSelection(event);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit,
                                        color: Colors.blue, size: 22),
                                    onPressed: () {
                                      ;
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.visibility,
                                        color: Colors.green, size: 22),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                    rows: DoctorService.createDoctorRows(filteredDoctors),
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      event.stateManager.setShowColumnFilter(true);
                      stateManager = event.stateManager;
                      stateManager.addListener(() {
                        if (previousPage != stateManager.page) {
                          Future.delayed(Duration.zero, () {
                            setState(() {
                              previousPage = stateManager.page;
                              stateManager.setPageSize(10, notify: true);
                              expandedRowIndex = null;

                              List<PlutoRow> newRows =
                                  DoctorService.createDoctorRows(
                                      filteredDoctors);
                              DoctorService.refreshGrid(
                                  newRows, stateManager, filteredDoctors);
                            });
                          });
                        }
                      });
                    },
                    onSelected: (PlutoGridOnSelectedEvent event) {
                      handleRowSelection(event);
                    },
                    configuration: PlutoGridConfiguration(
                      localeText: const PlutoGridLocaleText.french(),
                      style: PlutoGridStyleConfig(
                        iconColor: Colors.grey.shade700,
                        disabledIconColor: Colors.grey.shade400,
                        activatedBorderColor: AppColors.primaryColor,
                        columnTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                        cellTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto'),
                        gridBorderRadius: BorderRadius.circular(12),
                        iconSize: 24,
                        rowHeight: 55,
                        columnHeight: 50,
                        defaultColumnTitlePadding:
                            EdgeInsets.symmetric(horizontal: 10),
                        defaultCellPadding: EdgeInsets.all(10),
                        activatedColor: AppColors.hoverColor,
                        borderColor: Colors.grey.shade300,
                        gridBorderColor: Colors.grey.shade400,
                        gridBackgroundColor: Colors.white,
                        enableRowColorAnimation: true,
                        rowColor: Colors.white, // Default Row Color
                      ),
                    ),
                    createFooter: (stateManager) {
                      stateManager.setPageSize(10, notify: false);
                      return PlutoPagination(
                        stateManager,
                        pageSizeToMove: 1,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
