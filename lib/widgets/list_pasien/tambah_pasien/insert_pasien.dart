import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataPasien {
  final String patientName;
  final String patientAge;
  final String patientAddress;
  final String treatmentType;
  final String timeSchedule;
  final String description;
  final String doctorId;

  DataPasien({
    required this.patientName,
    required this.patientAge,
    required this.patientAddress,
    required this.treatmentType,
    required this.timeSchedule,
    required this.description,
    required this.doctorId,
  });
}

class ViewJson extends StatefulWidget {
  @override
  _ViewJsonState createState() => _ViewJsonState();
}

class _ViewJsonState extends State<ViewJson> {
  List<DataPasien> listDataPasien = [];
  TextEditingController _controllerPatientName = TextEditingController();
  TextEditingController _controllerPatientAge = TextEditingController();
  TextEditingController _controllerPatientAddress = TextEditingController();
  TextEditingController _controllerTreatmentType = TextEditingController();
  TextEditingController _controllerTimeSchedule = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerDoctorId = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedTime;

  @override
  void initState() {
    getDataPasien();
    super.initState();
  }

  Future<void> getDataPasien() async {
    var response = await http.get(Uri.parse("http://10.0.134.127:8080/gikuapp/list_pasien.php"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData); // Print the response for debugging purposes
      if (jsonData is List) {
        setState(() {
          listDataPasien = jsonData
              .map((data) => DataPasien(
                    patientName: data["patient_name"],
                    patientAge: data["patient_age"],
                    patientAddress: data["patient_address"],
                    treatmentType: data["treatment_type"],
                    timeSchedule: data["time_schedule"],
                    description: data["description"],
                    doctorId: data["doctor_id"],
                  ))
              .toList();
        });
      } else {
        print("Data is not in the expected format");
      }
    } else {
      print("Failed to load data");
    }
  }

  Future<void> insertDataPasien() async {
    var response = await http.post(
      Uri.parse("http://10.0.134.127:8080/gikuapp/insert.php"),
      body: {
        "patient_name": _controllerPatientName.text,
        "patient_age": _controllerPatientAge.text,
        "patient_address": _controllerPatientAddress.text,
        "treatment_type": _controllerTreatmentType.text,
        "time_schedule": _controllerTimeSchedule.text,
        "description": _controllerDescription.text,
        "doctor_id": _controllerDoctorId.text,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _controllerPatientName.text = "";
        _controllerPatientAge.text = "";
        _controllerPatientAddress.text = "";
        _controllerTreatmentType.text = "";
        _controllerTimeSchedule.text = "";
        _controllerDescription.text = "";
        _controllerDoctorId.text = "";
        getDataPasien();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Daftar Antrian"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Text("Form Daftar"),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerPatientName,
                            decoration: InputDecoration(hintText: "Nama Lengkap"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerPatientAddress,
                            decoration: InputDecoration(hintText: "Alamat"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerPatientAge,
                            decoration: InputDecoration(hintText: "Umur"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerTreatmentType,
                            decoration: InputDecoration(hintText: "Jenis Penanganan"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: DropdownButtonFormField<String>(
                            value: _selectedTime,
                            onChanged: (value) {
                              setState(() {
                                _selectedTime = value;
                                _controllerTimeSchedule.text = value ?? '';
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: "Pukul 16.00 - 16.30",
                                child: Text("Pukul 16.00 - 16.30"),
                              ),
                              DropdownMenuItem(
                                value: "Pukul 16.30 - 17.00",
                                child: Text("Pukul 16.30 - 17.00"),
                              ),
                              // Add more DropdownMenuItem if needed
                            ],
                            decoration: InputDecoration(
                              hintText: "Pilih Jam",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerDescription,
                            decoration: InputDecoration(hintText: "Deskripsi"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: TextField(
                            controller: _controllerDoctorId,
                            decoration: InputDecoration(hintText: "ID Dokter"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: insertDataPasien,
                    child: Text("Daftar"),
                  ),
                  SizedBox(height: 20),
                  Text("Daftar Antrian"),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: listDataPasien.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listDataPasien[index].patientName),
                        subtitle: Text(listDataPasien[index].timeSchedule),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteDataPasien(listDataPasien[index].patientName);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteDataPasien(String patientName) async {
    var response = await http.post(
      Uri.parse("http://10.0.134.127:8080/gikuapp/delete.php"),
      body: {
        "patient_name": patientName,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      getDataPasien();
    }
  }
}
