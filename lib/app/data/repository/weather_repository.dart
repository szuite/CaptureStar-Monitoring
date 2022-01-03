import 'package:capturestarmonitoring/app/data/provider/weather_api_client.dart';

class WeatherRepository {
  WeatherApiClient apiClient;

  var appId = 'd45e6bbbb79e95ba12a6bbf83ba8ce80';
  var units = 'metric';

  WeatherRepository({required this.apiClient});

  getWeather(double lat, double lon) {
    return apiClient.getWeather(lat, lon, units, appId);
  }
}