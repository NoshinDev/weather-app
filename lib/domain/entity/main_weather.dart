class MainWeather {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  MainWeather(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentWeather,
      this.hourlyUnits,
      this.hourly});

  MainWeather.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentWeather = json['current_weather'] != null
        ? CurrentWeather.fromJson(json['current_weather'])
        : null;
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
    if (currentWeather != null) {
      data['current_weather'] = currentWeather!.toJson();
    }
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }
}

class CurrentWeather {
  double? temperature;
  double? windspeed;
  double? winddirection;
  int? weathercode;
  int? isDay;
  String? time;

  CurrentWeather(
      {this.temperature,
      this.windspeed,
      this.winddirection,
      this.weathercode,
      this.isDay,
      this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    weathercode = json['weathercode'];
    isDay = json['is_day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['windspeed'] = windspeed;
    data['winddirection'] = winddirection;
    data['weathercode'] = weathercode;
    data['is_day'] = isDay;
    data['time'] = time;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? snowDepth;

  HourlyUnits({this.time, this.temperature2m, this.snowDepth});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    snowDepth = json['snow_depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['snow_depth'] = snowDepth;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<int>? weathercode;
  List<int>? snowDepth;

   Hourly({this.time, this.temperature2m, this.weathercode, this.snowDepth});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    weathercode = json['weathercode'].cast<int>();
    snowDepth = json['snow_depth'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weathercode;
    data['snow_depth'] = snowDepth;
    return data;
  }
}
