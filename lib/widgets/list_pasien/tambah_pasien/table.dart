import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataPasien extends StatefulWidget {
  @override
  _DataPasienState createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  Future<List<Patiens>> generatePatiensList() async {
    // Provide the URL of your server's get_Patiens_details.php file
    var url = Uri.parse('http://10.0.141.93:8080/gikuapp/db.php');

    final response = await http.get(url);
    var list = json.decode(response.body) as List<dynamic>;
    List<Patiens> patiensList = list.map((json) => Patiens.fromJson(json)).toList();
    return patiensList;
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'id',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Text('ID'),
        ),
      ),
      GridColumn(
        columnName: 'name',
        width: 80,
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Name'),
        ),
      ),
      GridColumn(
        columnName: 'age',
        width: 120,
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            'Age',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'address',
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Address'),
        ),
      ),
      GridColumn(
        columnName: 'description',
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Description'),
        ),
      ),
      GridColumn(
        columnName: 'doctor',
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Doctor'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion Flutter DataGrid'),
      ),
      body: FutureBuilder<List<Patiens>>(
        future: generatePatiensList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SfDataGrid(
              source: PatiensDataSource(snapshot.data),
              columns: getColumns(),
              columnWidthMode: ColumnWidthMode.fill,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class PatiensDataSource extends DataGridSource {
  PatiensDataSource(List<Patiens>? patiensList) {
    if (patiensList != null) {
      buildDataGridRow(patiensList);
    }
  }

  List<DataGridRow> _patiensDataGridRows = [];

  void buildDataGridRow(List<Patiens> patiensList) {
    _patiensDataGridRows = patiensList.map<DataGridRow>((e) {
      return DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: e.patiens_id),
          DataGridCell<String>(columnName: 'name', value: e.patient_name),
          DataGridCell<String>(columnName: 'age', value: e.patient_address),
          DataGridCell<String>(columnName: 'address', value: e.patient_age),
          DataGridCell<String>(columnName: 'description', value: e.description),
          DataGridCell<int>(columnName: 'doctor', value: e.doctor_id),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _patiensDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
class Patiens {
  final int patiens_id;
  final String patient_name;
  final String patient_age;
  final String patient_address;
  final String description;
  final int doctor_id;

  Patiens({
    required this.patiens_id,
    required this.patient_name,
    required this.patient_age,
    required this.patient_address,
    required this.description,
    required this.doctor_id,
  });

  factory Patiens.fromJson(Map<String, dynamic> json) {
    return Patiens(
      patiens_id: int.parse(json['patiens_id']),
      patient_name: json['patient_name'] as String,
      patient_age: json['patient_age'] as String,
      patient_address: json['patient_address'] as String,
      description: json['description'] as String,
      doctor_id: int.parse(json['doctor_id']),
    );
  }
}
// This class is used to allow self-signed certificates (for testing purposes only)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

