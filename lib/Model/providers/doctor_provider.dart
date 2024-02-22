import 'package:get/get.dart';

import '../doctor_model.dart';

class DoctorProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Doctor.fromJson(map);
      if (map is List) return map.map((item) => Doctor.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Doctor?> getDoctor(int id) async {
    final response = await get('doctor/$id');
    return response.body;
  }

  Future<Response<Doctor>> postDoctor(Doctor doctor) async =>
      await post('doctor', doctor);
  Future<Response> deleteDoctor(int id) async => await delete('doctor/$id');
}
