class ApiDay {
  final String sunrise;
  final String sunset;
  final String solarNoon;
  final int dayLength;

  ApiDay.fromApi(Map<String, dynamic> map)
      : sunrise = map['results']['sunrise'],
        sunset = map['results']['sunset'],
        solarNoon = map['results']['solarNoon'],
        dayLength = map['results']['dayLength'];
}
