import 'package:json_annotation/json_annotation.dart';

part 'open_weather_model.g.dart';

@JsonSerializable()
class OpenWeatherModel {
  OpenWeatherModel({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  OpenWeatherModel.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  @JsonKey(name: 'coord')
  Coord? _coord;

  List<Weather>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;

  @JsonKey(name: 'cod')
  int? _cod;

  Coord? get coord => _coord;

  List<Weather>? get weather => _weather;

  String? get base => _base;

  Main? get main => _main;

  int? get visibility => _visibility;

  Wind? get wind => _wind;

  Clouds? get clouds => _clouds;

  int? get dt => _dt;

  Sys? get sys => _sys;

  int? get timezone => _timezone;

  int? get id => _id;

  String? get name => _name;

  int? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}

/// type : 1
/// id : 5122
/// message : 0.0139
/// country : "US"
/// sunrise : 1560343627
/// sunset : 1560396563

@JsonSerializable()
class Sys {
  Sys({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    _type = type;
    _id = id;
    _message = message;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _message = json['message'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  int? _type;
  int? _id;
  double? _message;
  String? _country;
  int? _sunrise;
  int? _sunset;

  int? get type => _type;

  int? get id => _id;

  double? get message => _message;

  String? get country => _country;

  int? get sunrise => _sunrise;

  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['message'] = _message;
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

/// all : 1

@JsonSerializable()
class Clouds {
  Clouds({
    int? all,
  }) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  int? _all;

  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}

/// speed : 1.5
/// deg : 350

@JsonSerializable()
class Wind {
  Wind({
    double? speed,
    int? deg,
  }) {
    _speed = speed;
    _deg = deg;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
  }

  double? _speed;
  int? _deg;

  double? get speed => _speed;

  int? get deg => _deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    return map;
  }
}

/// temp : 282.55
/// feels_like : 281.86
/// temp_min : 280.37
/// temp_max : 284.26
/// pressure : 1023
/// humidity : 100

@JsonSerializable()
class Main {
  Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'] == null ? 0.0 : json['temp'].toDouble();
    _feelsLike = json['feels_like'] == null ? 0.0 : json['feels_like'].toDouble();
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _humidity;

  double? get temp => _temp;

  double? get feelsLike => _feelsLike;

  double? get tempMin => _tempMin;

  double? get tempMax => _tempMax;

  int? get pressure => _pressure;

  int? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

@JsonSerializable()
class Weather {
  Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;

  String? get main => _main;

  String? get description => _description;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}

/// lon : -122.08
/// lat : 37.39

@JsonSerializable()
class Coord {
  Coord({
    double? lon,
    double? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  double? _lon;
  double? _lat;

  double? get lon => _lon;

  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}
