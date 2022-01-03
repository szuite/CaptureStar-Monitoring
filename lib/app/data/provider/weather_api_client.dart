import 'package:capturestarmonitoring/app/data/model/open_weather_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/weather")
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET("/")
  Future<OpenWeatherModel> getWeather(
      @Query("lat") double lat,
      @Query("lon") double lon,
      @Query("units") String units,
      @Query("appid") String appid);
}
