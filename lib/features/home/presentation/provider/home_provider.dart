import 'package:ayurvedic_center/features/home/data/home_repository.dart';
import 'package:ayurvedic_center/features/home/data/models/patient_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getPatientsList();
  }

  List<Patient> patientList = [];
  bool isLoading = false;

  Future<void> getPatientsList() async {
    isLoading = true;
    notifyListeners();
    dynamic resp = await HomeRepository.getPatientsList();

    if (resp is List<Patient>) {
      patientList = resp;
    }

    isLoading = false;
    notifyListeners();
  }
}
