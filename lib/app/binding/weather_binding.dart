import 'package:capturestarmonitoring/app/controller/weather_controller.dart';
import 'package:capturestarmonitoring/app/data/provider/weather_api_client.dart';
import 'package:capturestarmonitoring/app/data/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../custom_log_interceptor.dart';

class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Dio _dio = Dio();
    _dio.interceptors.add(CustomLogInterceptor());

    Get.lazyPut<WeatherController>(() {
      return WeatherController(
          repository: WeatherRepository(apiClient: WeatherApiClient(_dio)));
    });
  }
}
