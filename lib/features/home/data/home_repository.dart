import 'package:ayurvedic_center/core/constants/api_paths.dart';
import 'package:ayurvedic_center/core/utils/my_dio.dart';
import 'package:ayurvedic_center/features/home/data/models/patient_model.dart';

class HomeRepository {
  static Future<dynamic> getPatientsList() async {
    dynamic resp = await MyDio().get(path: ApiPaths.patientList);

    if (resp is Map && resp.containsKey('patient')) {
      List<Map<String, dynamic>> list = List.from(resp['patient']);

      return list.map((e) => Patient.fromJson(e)).toList();
    }
  }
}
