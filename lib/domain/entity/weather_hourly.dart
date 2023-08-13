class WeatherHourly {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherHourly(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.hourlyUnits,
      this.hourly});

  WeatherHourly.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null
        ? HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
        json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativehumidity2m;
  String? apparentTemperature;
  String? precipitation;
  String? rain;
  String? weathercode;
  String? surfacePressure;
  String? visibility;
  String? evapotranspiration;
  String? windspeed10m;
  String? winddirection10m;
  String? windgusts10m;
  String? cloudcover;
  String? uvIndex;

  HourlyUnits(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.precipitation,
      this.rain,
      this.weathercode,
      this.surfacePressure,
      this.visibility,
      this.evapotranspiration,
      this.windspeed10m,
      this.winddirection10m,
      this.windgusts10m,
      this.cloudcover,
      this.uvIndex});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativehumidity2m = json['relativehumidity_2m'];
    apparentTemperature = json['apparent_temperature'];
    precipitation = json['precipitation'];
    rain = json['rain'];
    weathercode = json['weathercode'];
    surfacePressure = json['surface_pressure'];
    visibility = json['visibility'];
    evapotranspiration = json['evapotranspiration'];
    windspeed10m = json['windspeed_10m'];
    winddirection10m = json['winddirection_10m'];
    windgusts10m = json['windgusts_10m'];
    cloudcover = json['cloudcover'];
    uvIndex = json['uv_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['precipitation'] = precipitation;
    data['rain'] = rain;
    data['weathercode'] = weathercode;
    data['surface_pressure'] = surfacePressure;
    data['visibility'] = visibility;
    data['evapotranspiration'] = evapotranspiration;
    data['windspeed_10m'] = windspeed10m;
    data['winddirection_10m'] = winddirection10m;
    data['windgusts_10m'] = windgusts10m;
    data['cloudcover'] = cloudcover;
    data['uv_index'] = uvIndex;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<int>? relativehumidity2m;
  List<double>? apparentTemperature;
  List<int>? precipitation;
  List<int>? rain;
  List<int>? weathercode;
  List<double>? surfacePressure;
  List<double>? visibility;
  List<double>? evapotranspiration;
  List<double>? windspeed10m;
  List<int>? winddirection10m;
  List<double>? windgusts10m;
  List<int>? cloudcover;
  List<int>? uvIndex;

  Hourly(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.precipitation,
      this.rain,
      this.weathercode,
      this.surfacePressure,
      this.visibility,
      this.evapotranspiration,
      this.windspeed10m,
      this.winddirection10m,
      this.windgusts10m,
      this.cloudcover,
      this.uvIndex});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    relativehumidity2m = json['relativehumidity_2m'].cast<int>();
    apparentTemperature = json['apparent_temperature'].cast<double>();
    precipitation = json['precipitation'].cast<int>();
    rain = json['rain'].cast<int>();
    weathercode = json['weathercode'].cast<int>();
    surfacePressure = List<double>.from(json["surface_pressure"].map((x) => x));
    visibility = json['visibility'].cast<double>();
    evapotranspiration = json['evapotranspiration'].cast<double>();
    windspeed10m = json['windspeed_10m'].cast<double>();
    winddirection10m = json['winddirection_10m'].cast<int>();
    windgusts10m = json['windgusts_10m'].cast<double>();
    cloudcover = json['cloudcover'].cast<int>();
    uvIndex = json['uv_index'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['precipitation'] = precipitation;
    data['rain'] = rain;
    data['weathercode'] = weathercode;
    data['surface_pressure'] = surfacePressure;
    data['visibility'] = visibility;
    data['evapotranspiration'] = evapotranspiration;
    data['windspeed_10m'] = windspeed10m;
    data['winddirection_10m'] = winddirection10m;
    data['windgusts_10m'] = windgusts10m;
    data['cloudcover'] = cloudcover;
    data['uv_index'] = uvIndex;
    return data;
  }
}
