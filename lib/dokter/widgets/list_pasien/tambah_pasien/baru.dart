  class Dokter {
    final String patiens_id;
    final String patient_name;
    final String patient_age;
    final String patient_address;
    final String treatment_type;
    final String time_schedule;
    final String description;
    final int doctor_id;

  
    Dokter({
      required this.patiens_id,
      required this.patient_name,
      required this.patient_age,
      required this.patient_address,
      required this.treatment_type,
      required this.time_schedule,
      required this.description,
      required this.doctor_id,
    });
  
    factory Dokter.fromJson(Map<String, dynamic> json) {
      return Dokter(
        patiens_id: json['patiens_id'] as String,
        patient_name: json['patient_name'] as String,
        patient_age: json['patient_age'] as String,
        patient_address: json['patient_address'] as String,
        treatment_type: json['treatment_type'] as String,
        time_schedule: json['time_schedule'] as String,
        description: json['description'] as String,
        doctor_id: int.parse(json['doctor_id']),
      );
    }
  }