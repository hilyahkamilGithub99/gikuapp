import 'dart:convert';
import 'package:blog_app/widgets/list_pasien/tambah_pasien/baru.dart';
import 'package:http/http.dart' as http;

class Crud {
  static final ROOT = Uri.parse('http://10.0.141.93:8080/gikuapp/koneksi.php');
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_EMP_ACTION = 'ADD_EMP';
  static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const _DELETE_EMP_ACTION = 'DELETE_EMP';

static Future<List<Baru>> getBaru() async {
  try {
    var map = {'action': _GET_ALL_ACTION};
    final response = await http.post(ROOT, body: map);
    print('getBaru Response: ${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> list = parseResponse(response.body);
      return list.cast<Baru>(); // Cast List<dynamic> to List<Baru>
    } else {
      return <Baru>[]; // Return an empty list of Baru objects
    }
  } catch (e) {
    return <Baru>[]; // Return an empty list of Baru objects on exception/error
  }
}


  static List<dynamic> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Baru>((json) => Baru.fromJson(json)).toList();
  }

  // Method to add Baru to the database...
  static Future<String> addBaru(
    String patient_name,
    String patient_age,
    String patient_address,
    String treatment_type,
    String time_schedule,
    String description,
    int doctor_id,
  ) async {
     try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION ;
      map['patient_name'] = patient_name;
      map['patient_age'] = patient_age;
      map['patient_address'] = patient_address;
      map['treatment_type'] = treatment_type;
      map['time_schedule'] = time_schedule;
      map['description'] = description;
      map['doctor_id'] = doctor_id;
      final response = await http.post(ROOT, body: map);
      print('addBaru Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    }  catch (e) {
      return "error";
    }
  }

  // Method to update an Baru in the database...
  static Future<String> updateBaru(
    String patiens_id,
    String patient_name,
    String patient_age,
    String patient_address,
    String treatment_type,
    String time_schedule,
    String description,
    int doctor_id,
  ) async {
     try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_EMP_ACTION;
      map['patiens_id'] = patiens_id;
      map['patient_name'] = patient_name;
      map['patient_age'] = patient_age;
      map['patient_address'] = patient_address;
      map['treatment_type'] = treatment_type;
      map['time_schedule'] = time_schedule;
      map['description'] = description;
      map['doctor_id'] = doctor_id;
      final response = await http.post(ROOT, body: map);
      print('updateBaru Response Body: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
  // Method to delete an Baru from the database...
  static Future<String> deleteBaru(String patiens_id) async {
    try {
      var map = {
        'action': _DELETE_EMP_ACTION,
        'patiens_id': patiens_id,
      };

      final response = await http.post(ROOT, body: map);
      print('deleteBaru Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
