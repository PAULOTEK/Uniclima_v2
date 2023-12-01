class ClimaData {
  double? temp;
  double? tempMin;
  double? tempMax;
  double? feelsLike;
  String? descTemp;
  String? icon;
  int? humidity;

  ClimaData({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.feelsLike,
    this.descTemp,
    this.humidity,
    this.icon,
  });
  factory ClimaData.fromJson(Map<String, dynamic> json) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    return ClimaData(
        temp: json['main']['temp'].toDouble(),
        tempMin: json['main']['temp'].toDouble(),
        tempMax: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'].toDouble(),
        descTemp: capitalize(json['weather'][0]['description']),
        icon: json['weather'][0]['icon'],
        humidity: json['main']['humidity'].toInt());
  }
  static List<ClimaData> listFromJsonArray(List<dynamic> list) {
    return list.map<ClimaData>((json) => ClimaData.fromJson(json)).toList();
  }
}
