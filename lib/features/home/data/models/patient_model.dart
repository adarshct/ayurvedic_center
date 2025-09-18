class Patient {
  int? id;
  List<PatientDetail>? patientDetailsSet;
  Branch? branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  dynamic price;
  num? totalAmount;
  num? discountAmount;
  num? advanceAmount;
  num? balanceAmount;
  DateTime? dateNdTime;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Patient({
    this.id,
    this.patientDetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['patientdetails_set'] != null) {
      patientDetailsSet = (json['patientdetails_set'] as List)
          .map((e) => PatientDetail.fromJson(e))
          .toList();
    }
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    user = json['user'];
    payment = json['payment'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    price = json['price'];
    totalAmount = json['total_amount'];
    discountAmount = json['discount_amount'];
    advanceAmount = json['advance_amount'];
    balanceAmount = json['balance_amount'];
    dateNdTime = json['date_nd_time'] != null
        ? DateTime.parse(json['date_nd_time'])
        : null;
    isActive = json['is_active'];
    createdAt = json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null;
  }
}

class PatientDetail {
  int? id;
  String? male;
  String? female;
  int? patient;
  int? treatment;
  String? treatmentName;

  PatientDetail({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  PatientDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    male = json['male'];
    female = json['female'];
    patient = json['patient'];
    treatment = json['treatment'];
    treatmentName = json['treatment_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['male'] = male;
    data['female'] = female;
    data['patient'] = patient;
    data['treatment'] = treatment;
    data['treatment_name'] = treatmentName;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branch({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    patientsCount = json['patients_count'];
    location = json['location'];
    phone = json['phone'];
    mail = json['mail'];
    address = json['address'];
    gst = json['gst'];
    isActive = json['is_active'];
  }
}
