import 'package:blog_app/dokter/widgets/list_pasien/tambah_pasien/baru.dart';
import 'package:flutter/material.dart';
import 'crud.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage() : super();

  final String title = 'Antrian Anda';

  @override
  DataTablePageState createState() => DataTablePageState();
}

class DataTablePageState extends State<DataTablePage> {
  late List<Dokter> _Dokters;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _patientAgeController = TextEditingController();
  TextEditingController _patientAddressController = TextEditingController();
  TextEditingController _treatmentTypeController = TextEditingController();
  TextEditingController _queueNumberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _doctorIdController = TextEditingController();
  late Dokter _selectedDokter;
  late bool _isUpdating;
  String _titleProgress = '';

  @override
  void initState() {
    super.initState();
    _Dokters = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _patientNameController = TextEditingController();
    _patientAgeController = TextEditingController();
    _patientAddressController = TextEditingController();
    _treatmentTypeController = TextEditingController();
    _queueNumberController = TextEditingController();
    _descriptionController = TextEditingController();
    _doctorIdController = TextEditingController();
    _getDokters();
  }

  void _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _addDokter() {
    if (_patientNameController.text.isEmpty ||
        _patientAgeController.text.isEmpty ||
        _patientAddressController.text.isEmpty ||
        _treatmentTypeController.text.isEmpty ||
        _queueNumberController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _doctorIdController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showSnackBar(context, 'Adding...');
    Crud.addDokter(
      _patientNameController.text,
      _patientAgeController.text,
      _patientAddressController.text,
      _treatmentTypeController.text,
      _queueNumberController.text,
      _descriptionController.text,
      int.parse(_doctorIdController.text),
    ).then((result) {
      if ('success' == result) {
        _getDokters();
        _clearValues();
      }
    });
  }

  void _getDokters() {
    _showProgress('Antrian...');
    Crud.getDokter().then((Dokters) {
      setState(() {
        _Dokters = Dokters;
      });
      _showProgress(widget.title);
      print("Length ${Dokters.length}");
    });
  }

  _updateDokter(Dokter Dokter) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Updating Dokter...');
    Crud.updateDokter(
      Dokter.patiens_id,
      _patientNameController.text,
      _patientAgeController.text,
      _patientAddressController.text,
      _treatmentTypeController.text,
      _queueNumberController.text,
      _descriptionController.text,
      int.parse(_doctorIdController.text),
    ).then((result) {
      if ('success' == result) {
        _getDokters(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }

  void _deleteDokter(Dokter Dokter) {
    _showProgress('Deleting Dokter...');
    Crud.deleteDokter(Dokter.patiens_id).then((result) {
      if ('success' == result) {
        _getDokters();
      }
    });
  }

  void _showValues(Dokter Dokter) {
    setState(() {
      _isUpdating = true;
    });
    _patientNameController.text = Dokter.patient_name;
    _patientAgeController.text = Dokter.patient_age;
    _patientAddressController.text = Dokter.patient_address;
    _treatmentTypeController.text = Dokter.treatment_type;
    _queueNumberController.text = Dokter.time_schedule;
    _descriptionController.text = Dokter.description;
    _doctorIdController.text = Dokter.doctor_id.toString();
    _selectedDokter = Dokter;
  }

  void _clearValues() {
    _patientNameController.text = '';
    _patientAgeController.text = '';
    _patientAddressController.text = '';
    _treatmentTypeController.text = '';
    _queueNumberController.text = '';
    _descriptionController.text = '';
    _doctorIdController.text = '';
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Nama'),
          ),
          DataColumn(
            label: Text('Antrian jam'),
          ),
          DataColumn(
            label: Text('Delete'),
          ),
        ],
        rows: _Dokters.map(
          (Dokter) => DataRow(
            cells: [
              DataCell(
                Text(Dokter.patiens_id),
                onTap: () {
                  _showValues(Dokter);
                },
              ),
              DataCell(
                Text(Dokter.patient_name.toUpperCase()),
                onTap: () {
                  _showValues(Dokter);
                },
              ),
              DataCell(
                Text(Dokter.time_schedule),
                onTap: () {
                  _showValues(Dokter);
                },
              ),
              DataCell(
                IconButton(
                  onPressed: () {
                    _deleteDokter(Dokter);
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getDokters();
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            TextField(
              enabled: false,
              controller: _patientNameController,
              decoration: InputDecoration(labelText: 'Nama Pasien'),
            ),
            TextField(
              enabled: false,
              controller: _patientAgeController,
              decoration: InputDecoration(labelText: 'Umur'),
            ),
            TextField(
              enabled: false,
              controller: _patientAddressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              enabled: false,
              controller: _treatmentTypeController,
              decoration: InputDecoration(labelText: 'Jenis penanganan'),
            ),
            TextField(
              controller: _queueNumberController,
              decoration: InputDecoration(labelText: 'Antrian'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
            TextField(
              controller: _doctorIdController,
              decoration: InputDecoration(labelText: 'Doctor ID'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            _isUpdating
                ? Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _updateDokter(_selectedDokter);
                        },
                        child: Text('UPDATE'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                            _clearValues();
                          });
                        },
                        child: Text('CANCEL'),
                      ),
                    ],
                  )
                : Container(),
            Divider(
              height: 20.0,
              color: Colors.grey[800],
            ),
            SizedBox(
              height: 20.0,
            ),
            _dataBody(),
          ],
        ),
      ),
    );
  }
}
