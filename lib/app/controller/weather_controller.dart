import 'package:capturestarmonitoring/app/data/model/open_weather_model.dart';
import 'package:capturestarmonitoring/app/data/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class WeatherController extends GetxController {
  final WeatherRepository repository;

  WeatherController({required this.repository});

  var logger = Logger();
  final weatherModel = OpenWeatherModel().obs;

  final RxDouble _lat = 0.0.obs;
  final RxDouble _lon = 0.0.obs;

  get lat => _lat.value;

  set lat(value) {
    _lat.value = value;
  }

  get lon => _lon.value;

  set lon(value) {
    _lon.value = value;
  }

  getWeather({required double lat, required double lon}) async {
    try {
      var resp = await repository.getWeather(lat, lon);
      weatherModel.value = resp;
    } on DioError catch (e) {
      final res = (e).response;
      logger.e("Got Error: ${res!.data} -> ${res.statusMessage}");
    } finally {
    }
  }

  Future<Position> getLocation() async {
    var currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    return currentPosition;
  }
}
