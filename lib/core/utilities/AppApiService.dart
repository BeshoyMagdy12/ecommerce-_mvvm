
import 'package:dio/dio.dart';
import 'package:ecco_app/core/utilities/cash_healper.dart';

class ApiService {
  static final Dio _dio = Dio();

  static void initialize() {
    _dio.options.baseUrl = "https://student.valuxapps.com/api/";
    _dio.options.connectTimeout = Duration(seconds: 5000) ;
    _dio.options.receiveTimeout =Duration(seconds: 3000) ;
    _dio.options.headers={
      "Authorization":CasheHelper.getDataString(key: "token"),
      "lang":"en"
    };
  }

  // Static method for making a GET request
  static Future<Response<dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Static method for making a POST request
  static Future<Response<dynamic>> post(String endpoint, Map<String,dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Static method for making a PUT request
  static Future<Response<dynamic>> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Static method for making a DELETE request
  static Future<Response<dynamic>> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Static method for making an UPDATE request (you can customize this)
  static Future<Response<dynamic>> update(String endpoint, dynamic data) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

// Add more static methods for different API endpoints and request types as needed.
}
