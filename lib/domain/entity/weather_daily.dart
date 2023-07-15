class WeatherDaily {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherDaily(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.dailyUnits,
      this.daily});

  WeatherDaily.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    dailyUnits = json['daily_units'] != null
        ? DailyUnits.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
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
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits!.toJson();
    }
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    return data;
  }
}

class DailyUnits {
  String? time;
  String? weathercode;
  String? temperature2mMax;
  String? temperature2mMin;
  String? apparentTemperatureMax;
  String? apparentTemperatureMin;
  String? sunrise;
  String? sunset;
  String? precipitationSum;
  String? precipitationProbabilityMax;
  String? windspeed10mMax;
  String? windgusts10mMax;
  String? uvIndexMax;
  String? rainSum;
  String? winddirection10mDominant;

  DailyUnits(
      {this.time,
      this.weathercode,
      this.temperature2mMax,
      this.temperature2mMin,
      this.apparentTemperatureMax,
      this.apparentTemperatureMin,
      this.sunrise,
      this.sunset,
      this.precipitationSum,
      this.precipitationProbabilityMax,
      this.windspeed10mMax,
      this.windgusts10mMax,
      this.uvIndexMax,
      this.rainSum,
      this.winddirection10mDominant});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    weathercode = json['weathercode'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    apparentTemperatureMax = json['apparent_temperature_max'];
    apparentTemperatureMin = json['apparent_temperature_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    precipitationSum = json['precipitation_sum'];
    precipitationProbabilityMax = json['precipitation_probability_max'];
    windspeed10mMax = json['windspeed_10m_max'];
    windgusts10mMax = json['windgusts_10m_max'];
    uvIndexMax = json['uv_index_max'];
    rainSum = json['rain_sum'];
    winddirection10mDominant = json['winddirection_10m_dominant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['apparent_temperature_max'] = apparentTemperatureMax;
    data['apparent_temperature_min'] = apparentTemperatureMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['precipitation_sum'] = precipitationSum;
    data['precipitation_probability_max'] = precipitationProbabilityMax;
    data['windspeed_10m_max'] = windspeed10mMax;
    data['windgusts_10m_max'] = windgusts10mMax;
    data['uv_index_max'] = uvIndexMax;
    data['rain_sum'] = rainSum;
    data['winddirection_10m_dominant'] = winddirection10mDominant;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? precipitationSum;
  List<int>? precipitationProbabilityMax;
  List<double>? windspeed10mMax;
  List<double>? windgusts10mMax;
  List<double>? uvIndexMax;
  List<double>? rainSum;
  List<int>? winddirection10mDominant;

  Daily(
      {this.time,
      this.weathercode,
      this.temperature2mMax,
      this.temperature2mMin,
      this.apparentTemperatureMax,
      this.apparentTemperatureMin,
      this.sunrise,
      this.sunset,
      this.precipitationSum,
      this.precipitationProbabilityMax,
      this.windspeed10mMax,
      this.windgusts10mMax,
      this.uvIndexMax,
      this.rainSum,
      this.winddirection10mDominant});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    weathercode = json['weathercode'].cast<int>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    apparentTemperatureMax = json['apparent_temperature_max'].cast<double>();
    apparentTemperatureMin = json['apparent_temperature_min'].cast<double>();
    sunrise = json['sunrise'].cast<String>();
    sunset = json['sunset'].cast<String>();
    precipitationSum = json['precipitation_sum'].cast<double>();
    precipitationProbabilityMax =
        json['precipitation_probability_max'].cast<int>();
    windspeed10mMax = json['windspeed_10m_max'].cast<double>();
    windgusts10mMax = json['windgusts_10m_max'].cast<double>();
    uvIndexMax = json['uv_index_max'].cast<double>();
    rainSum = json['rain_sum'].cast<double>();
    winddirection10mDominant = json['winddirection_10m_dominant'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['apparent_temperature_max'] = apparentTemperatureMax;
    data['apparent_temperature_min'] = apparentTemperatureMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['precipitation_sum'] = precipitationSum;
    data['precipitation_probability_max'] = precipitationProbabilityMax;
    data['windspeed_10m_max'] = windspeed10mMax;
    data['windgusts_10m_max'] = windgusts10mMax;
    data['uv_index_max'] = uvIndexMax;
    data['rain_sum'] = rainSum;
    data['winddirection_10m_dominant'] = winddirection10mDominant;
    return data;
  }
}
